const Event = require('../models/event');
const logger = require('../utils/logger');

const createEvent = async (req, res) => {
  try {
    const event = new Event(req.body);
    const result = await event.save();
    logger.info('Create event successful');
    res.status(201).send(result);
  } catch (error) {
    logger.error('Create event failed: ' + error.stack);
    res.status(500).send(error.message);
  }
};

const getAllEvents = async (req, res) => {
  try {
    const events = await Event.find();
    logger.info('Read all events successful');
    res.status(200).send(events);
  } catch (error) {
    logger.error('Read all events failed: ' + error.stack);
    res.status(500).send(error.message);
  }
};

const getEventById = async (req, res) => {
  try {
    const event = await Event.findById(req.params.event_id);
    if (!event) {
      logger.warn('Read single event failed: Event not found');
      res.status(404).send('Event not found');
    } else {
      logger.info('Read single event successful');
      res.status(200).send(event);
    }
  } catch (error) {
    logger.error('Read single event failed: ' + error.stack);
    res.status(500).send(error.message);
  }
};

const updateEvent = async (req, res) => {
  try {
    const event = await Event.findByIdAndUpdate(req.params.event_id, req.body, { new: true });
    if (!event) {
      logger.warn('Update event failed: Event not found');
      res.status(404).send('Event not found');
    } else {
      logger.info('Update event successful');
      res.status(200).send(event);
    }
  } catch (error) {
    logger.error('Update event failed: ' + error.stack);
    res.status(500).send(error.message);
  }
};

module.exports = {
  createEvent,
  getAllEvents,
  getEventById,
  updateEvent
};
