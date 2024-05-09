const Stuff = require('../models/stuff');
const logger = require('../utils/logger');

const createStuff = async (req, res) => {
  try {
    const stuff = new Stuff(req.body);
    const result = await stuff.save();
    logger.info('Create stuff successful');
    res.status(201).send(result);
  } catch (error) {
    logger.error('Create stuff failed: ' + error.stack);
    res.status(500).send(error.message);
  }
};

const getAllStuff = async (req, res) => {
  try {
    const stuff = await Stuff.find();
    logger.info('Read all stuff successful');
    res.status(200).send(stuff);
  } catch (error) {
    logger.error('Read all stuff failed: ' + error.stack);
    res.status(500).send(error.message);
  }
};

const getStuffById = async (req, res) => {
  try {
    const stuff = await Stuff.findById(req.params.stuff_id);
    if (!stuff) {
      logger.warn('Read single stuff failed: Stuff not found');
      res.status(404).send('Stuff not found');
    } else {
      logger.info('Read single stuff successful');
      res.status(200).send(stuff);
    }
  } catch (error) {
    logger.error('Read single stuff failed: ' + error.stack);
    res.status(500).send(error.message);
  }
};

const updateStuff = async (req, res) => {
  try {
    const stuff = await Stuff.findByIdAndUpdate(req.params.stuff_id, req.body, { new: true });
    if (!stuff) {
      logger.warn('Update stuff failed: Stuff not found');
      res.status(404).send('Stuff not found');
    } else {
      logger.info('Update stuff successful');
      res.status(200).send(stuff);
    }
  } catch (error) {
    logger.error('Update stuff failed: ' + error.stack);
    res.status(500).send(error.message);
  }
};

module.exports = {
  createStuff,
  getAllStuff,
  getStuffById,
  updateStuff
};
