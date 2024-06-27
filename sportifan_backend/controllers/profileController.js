'use strict';

const firebase = require('../db');
const Profile = require('../models/profile');
const firestore = firebase.firestore();


const addProfile = async (req, res, next) => {
    try {
        const data = req.body;
        await firestore.collection('profiles').doc().set(data);
        res.send('Profile added successfully');
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const getAllProfiles = async (req, res, next) => {
    try {
        const profiles = await firestore.collection('profiles');
        const data = await profiles.get();
        const profileArray = [];
        if(data.empty) {
            res.status(404).send('No profiles found');
        }else {
            data.forEach(doc => {
                const  profile= new Profile(
                    doc.id,
                    doc.data().bio,
                    doc.data().username,
                    doc.data().emailId,
                    doc.data().phoneNumber,
                    doc.data().userId,
                    doc.data().status
                );
                profileArray.push(profile);
            });
            res.send(profileArray);
        }
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const getProfile = async (req, res, next) => {
    try {
        const id = req.params.id;
        const profile = await firestore.collection('profiles').doc(id);
        const data = await profile.get();
        if(!data.exists) {
            res.status(404).send('Profile with the given ID not found');
        }else {
            res.send(data.data());
        }
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const updateProfile = async (req, res, next) => {
    try {
        const id = req.params.id;
        const data = req.body;
        const profile =  await firestore.collection('profiles').doc(id);
        await profile.update(data);
        res.send('Profile details updated successfuly');        
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const deleteProfile = async (req, res, next) => {
    try {
        const id = req.params.id;
        await firestore.collection('profiles').doc(id).delete();
        res.send('Profile deleted successfuly');
    } catch (error) {
        res.status(400).send(error.message);
    }
}

module.exports = {
    addProfile,
    deleteProfile,
    updateProfile,
    getAllProfiles,
    getProfile
}