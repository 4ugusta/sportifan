const express = require('express');
const {addTeam, 
       getAllTeams, 
       getTeam,
       updateTeam,
       deleteTeam
      } = require('../controllers/teamController');

const router = express.Router();

router.post('/addTeam', addTeam);
router.get('/teams', getAllTeams);
router.get('/team/:id', getTeam);
router.put('/team/:id', updateTeam);
router.delete('/team/:id', deleteTeam);


module.exports = {
    routes: router
}