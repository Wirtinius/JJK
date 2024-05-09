const News = require('../models/news');
const logger = require('../utils/logger');

const createNews = async (req, res) => {
  try {
    const news = new News(req.body);
    const result = await news.save();
    logger.info('Create news successful');
    res.status(201).send(result);
  } catch (error) {
    logger.error('Create news failed: ' + error.stack);
    res.status(500).send(error.message);
  }
};

const getAllNews = async (req, res) => {
  try {
    const news = await News.find();
    logger.info('Read all news successful');
    res.status(200).send(news);
  } catch (error) {
    logger.error('Read all news failed: ' + error.stack);
    res.status(500).send(error.message);
  }
};

const getNewsById = async (req, res) => {
  try {
    const news = await News.findById(req.params.news_id);
    if (!news) {
      logger.warn('Read single news failed: News not found');
      res.status(404).send('News not found');
    } else {
      logger.info('Read single news successful');
      res.status(200).send(news);
    }
  } catch (error) {
    logger.error('Read single news failed: ' + error.stack);
    res.status(500).send(error.message);
  }
};

const updateNews = async (req, res) => {
  try {
    const news = await News.findByIdAndUpdate(req.params.news_id, req.body, { new: true });
    if (!news) {
      logger.warn('Update news failed: News not found');
      res.status(404).send('News not found');
    } else {
      logger.info('Update news successful');
      res.status(200).send(news);
    }
  } catch (error) {
    logger.error('Update news failed: ' + error.stack);
    res.status(500).send(error.message);
  }
};

module.exports = {
  createNews,
  getAllNews,
  getNewsById,
  updateNews
};
