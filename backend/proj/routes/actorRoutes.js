const express = require('express');
const router = express.Router();
const actorController = require('../controller/actorController');
// const { checkAuth } = require('../middleware/authMiddleware');

// router.post('/', checkAuth, actorController.createActor);
// router.get('/', checkAuth, actorController.getAllActors);
// router.get('/:actor_id', checkAuth, actorController.getActorById);
// router.put('/:actor_id', checkAuth, actorController.updateActor);

router.post('/', actorController.createActor);
router.get('/', actorController.getAllActors);
router.get('/:actor_id', actorController.getActorById);
router.put('/:actor_id', actorController.updateActor);

module.exports = router;

