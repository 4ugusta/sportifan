"use strict";

const firebase = require("../db");
const Team = require("../models/team");
const firestore = firebase.firestore();

const addTeam = async (req, res, next) => {
  try {
    const { teamData, players } = req.body;
    const teamRef = await firestore.collection("teams").add(teamData);

    const teamId = teamRef.id;

    await Promise.all(
      players.map(async (player) => {
        await firestore
          .collection("teams")
          .doc(teamId)
          .collection("players")
          .add(player);
      })
    );
    res.status(200).send("Team and players added successfully");
  } catch (error) {
    res.status(400).send(error.message);
  }
};

const getAllTeams = async (req, res, next) => {
  try {
    const teamsSnapshot = await firestore.collection("teams").get();
    const teams = [];

    if (teamsSnapshot.empty) {
      res.status(404).send("No teams found");
      return;
    }

    for (const teamDoc of teamsSnapshot.docs) {
      const teamData = teamDoc.data();
      const playersSnapshot = await firestore
        .collection("teams")
        .doc(teamDoc.id)
        .collection("players")
        .get();
      const players = playersSnapshot.docs.map((doc) => doc.data());
      const team = {
        id: teamDoc.id,
        ...teamData,
        players: players,
      };
      teams.push(team);
    }

    res.send(teams);
  } catch (error) {
    res.status(400).send(error.message);
  }
};

const getTeam = async (req, res, next) => {
  try {
    const id = req.params.id;
    const teamDoc = await firestore.collection("teams").doc(id).get();

    if (!teamDoc.exists) {
      res.status(404).send("Team with the given ID not found");
      return;
    }

    const teamData = teamDoc.data();
    const playersSnapshot = await firestore
      .collection("teams")
      .doc(id)
      .collection("players")
      .get();
    const players = playersSnapshot.docs.map((doc) => doc.data());
    const team = {
      id: teamDoc.id,
      ...teamData,
      players: players,
    };

    res.send(team);
  } catch (error) {
    res.status(400).send(error.message);
  }
};

const updateTeam = async (req, res, next) => {
  try {
    const id = req.params.id;
    const data = req.body;
    await firestore.collection("teams").doc(id).update(data);
    res.send("Team details updated successfully");
  } catch (error) {
    res.status(400).send(error.message);
  }
};

const deleteTeam = async (req, res, next) => {
  try {
    const id = req.params.id;
    await firestore.collection("teams").doc(id).delete();
    res.status(200).send("Team deleted successfully");
  } catch (error) {
    res.status(400).send(error.message);
  }
};

module.exports = {
  addTeam,
  deleteTeam,
  updateTeam,
  getAllTeams,
  getTeam,
};
