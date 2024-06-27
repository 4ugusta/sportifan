const express = require('express');
const {addProfile, 
       getAllProfiles, 
       getProfile,
       updateProfile,
       deleteProfile
      } = require('../controllers/profileController');

const router = express.Router();

router.post('/addProfile', addProfile);
router.get('/profiles', getAllProfiles);
router.get('/profile/:id', getProfile);
router.put('/profile/:id', updateProfile);
router.delete('/profile/:id', deleteProfile);


module.exports = {
    routes: router
}