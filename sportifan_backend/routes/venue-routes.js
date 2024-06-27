const express = require('express');
const {addVenue, 
       getAllVenues, 
       getVenue,
       updateVenue,
       deleteVenue
      } = require('../controllers/venueController');

const router = express.Router();

router.post('/addVenue', addVenue);
router.get('/venues', getAllVenues);
router.get('/venue/:id', getVenue);
router.put('/venue/:id', updateVenue);
router.delete('/venue/:id', deleteVenue);


module.exports = {
    routes: router
}