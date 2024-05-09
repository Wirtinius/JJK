const Comment = require('../models/comment');
const logger = require('../utils/logger');

const createComment = async (req, res) => {
  try {
    const comment = new Comment({ ...req.body, user: req.user.id });
    const result = await comment.save();
    logger.info('Create comment successful');
    res.status(201).send(result);
  } catch (error) {
    logger.error('Create comment failed: ' + error.stack);
    res.status(500).send(error.message);
  }
};

const getAllComments = async (req, res) => {
  try {
    const comments = await Comment.find();
    logger.info('Read all comments successful');
    res.status(200).send(comments);
  } catch (error) {
    logger.error('Read all comments failed: ' + error.stack);
    res.status(500).send(error.message);
  }
};

const getCommentById = async (req, res) => {
  try {
    const comment = await Comment.findById(req.params.comment_id);
    if (!comment) {
      logger.warn('Read single comment failed: Comment not found');
      res.status(404).send('Comment not found');
    } else {
      logger.info('Read single comment successful');
      res.status(200).send(comment);
    }
  } catch (error) {
    logger.error('Read single comment failed: ' + error.stack);
    res.status(500).send(error.message);
  }
};

const updateComment = async (req, res) => {
  try {
    const comment = await Comment.findByIdAndUpdate(req.params.comment_id, req.body, { new: true });
    if (!comment) {
      logger.warn('Update comment failed: Comment not found');
      res.status(404).send('Comment not found');
    } else {
      logger.info('Update comment successful');
      res.status(200).send(comment);
    }
  } catch (error) {
    logger.error('Update comment failed: ' + error.stack);
    res.status(500).send(error.message);
  }
};

module.exports = {
  createComment,
  getAllComments,
  getCommentById,
  updateComment
};
