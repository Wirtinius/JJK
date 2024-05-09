const Actor = require('../models/actor');
const logger = require('../utils/logger');

const createActor = async (req, res) => {
  try {
    const actor = new Actor(req.body);
    const result = await actor.save();
    logger.info('Create actor successful');
    res.status(201).send(result);
  } catch (error) {
    logger.error('Create actor failed: ' + error.stack);
    res.status(500).send(error.message);
  }
};

const getAllActors = async (req, res) => {
  try {
    const actors = await Actor.find();
    logger.info('Read all actors successful');
    res.status(200).send(actors);
  } catch (error) {
    logger.error('Read all actors failed: ' + error.stack);
    res.status(500).send(error.message);
  }
};

const getActorById = async (req, res) => {
  try {
    const actor = await Actor.findById(req.params.actor_id);
    if (!actor) {
      logger.warn('Read single actor failed: Actor not found');
      res.status(404).send('Actor not found');
    } else {
      logger.info('Read single actor successful');
      res.status(200).send(actor);
    }
  } catch (error) {
    logger.error('Read single actor failed: ' + error.stack);
    res.status(500).send(error.message);
  }
};

const updateActor = async (req, res) => {
  try {
    const actor = await Actor.findByIdAndUpdate(req.params.actor_id, req.body, { new: true });
    if (!actor) {
      logger.warn('Update actor failed: Actor not found');
      res.status(404).send('Actor not found');
    } else {
      logger.info('Update actor successful');
      res.status(200).send(actor);
    }
  } catch (error) {
    logger.error('Update actor failed: ' + error.stack);
    res.status(500).send(error.message);
  }
};

module.exports = {
  createActor,
  getAllActors,
  getActorById,
  updateActor
};
