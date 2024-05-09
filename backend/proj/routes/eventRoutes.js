const express = require('express');
const router = express.Router();
const eventController = require('../controller/eventController');

router.post('/', eventController.createEvent);
router.get('/', eventController.getAllEvents);
router.get('/:event_id', eventController.getEventById);
router.put('/:event_id', eventController.updateEvent);

module.exports = router;
