"use strict";

const firebase = require("../db");
const Venue = require("../models/venue");
const firestore = firebase.firestore();

const addVenue = async (req, res, next) => {
  try {
    const data = req.body;
    await firestore.collection("venues").doc().set(data);
    res.send("Venue added successfully");
  } catch (error) {
    res.status(400).send(error.message);
  }
};

const getAllVenues = async (req, res, next) => {
  try {
    let venuesRef = firestore.collection("venues");

    const { search } = req.query;

    if (search) {
      venuesRef = venuesRef.where("venueName", "==", search);
    }

    const snapshot = await venuesRef.get();

    if (snapshot.empty) {
      res.status(404).send("No venue found");
      return;
    }

    const venuesArray = [];
    snapshot.forEach((doc) => {
      const venue = new Venue(
        doc.id,
        doc.data().venueName,
        doc.data().venuCharge,
        doc.data().venueLocation,
        doc.data().venueRating,
        doc.data().status
      );
      venuesArray.push(venue);
    });

    res.send(venuesArray);
  } catch (error) {
    res.status(400).send(error.message);
  }
};

const getVenue = async (req, res, next) => {
  try {
    const id = req.params.id;
    const venue = await firestore.collection("venues").doc(id);
    const data = await venue.get();
    if (!data.exists) {
      res.status(404).send("Venue with the given ID not found");
    } else {
      res.send(data.data());
    }
  } catch (error) {
    res.status(400).send(error.message);
  }
};

const updateVenue = async (req, res, next) => {
  try {
    const id = req.params.id;
    const data = req.body;
    const venue = await firestore.collection("venues").doc(id);
    await venue.update(data);
    res.send("Venue details updated successfuly");
  } catch (error) {
    res.status(400).send(error.message);
  }
};

const deleteVenue = async (req, res, next) => {
  try {
    const id = req.params.id;
    await firestore.collection("venues").doc(id).delete();
    res.send("Venue deleted successfuly");
  } catch (error) {
    res.status(400).send(error.message);
  }
};

module.exports = {
  addVenue,
  deleteVenue,
  updateVenue,
  getAllVenues,
  getVenue,
};
