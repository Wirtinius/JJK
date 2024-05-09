const express = require('express');
const router = express.Router();
const commentController = require('../controller/commentController');
// const { checkAuth } = require('../middleware/authMiddleware');

// router.post('/', checkAuth, actorController.createActor);
// router.get('/', checkAuth, actorController.getAllActors);
// router.get('/:actor_id', checkAuth, actorController.getActorById);
// router.put('/:actor_id', checkAuth, actorController.updateActor);

router.post('/', commentController.createComment);
router.get('/', commentController.getAllComments);
router.get('/:comment_id', commentController.getCommentById);
router.put('/:comment_id', commentController.updateComment);

module.exports = router;

