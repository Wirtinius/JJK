const express = require('express');
const router = express.Router();
const actorController = require('../controller/actorController');

/**
 * @swagger
 * tags:
 *   name: Actors
 *   description: Endpoints for managing actors
 */

/**
 * @swagger
 * /actors:
 *   post:
 *     summary: Create a new actor
 *     tags: [Actors]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Actor'
 *     responses:
 *       '201':
 *         description: Successfully created actor
 *       '400':
 *         description: Bad request
 */

router.post('/', actorController.createActor);

/**
 * @swagger
 * /actors:
 *   get:
 *     summary: Get all actors
 *     tags: [Actors]
 *     responses:
 *       '200':
 *         description: Successfully retrieved actors
 *       '404':
 *         description: Not found
 */

router.get('/', actorController.getAllActors);

/**
 * @swagger
 * /actors/{actor_id}:
 *   get:
 *     summary: Get actor by ID
 *     tags: [Actors]
 *     parameters:
 *       - in: path
 *         name: actor_id
 *         required: true
 *         description: ID of the actor to retrieve
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: Successfully retrieved actor
 *       '404':
 *         description: Not found
 */

router.get('/:actor_id', actorController.getActorById);

/**
 * @swagger
 * /actors/{actor_id}:
 *   put:
 *     summary: Update actor by ID
 *     tags: [Actors]
 *     parameters:
 *       - in: path
 *         name: actor_id
 *         required: true
 *         description: ID of the actor to update
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Actor'
 *     responses:
 *       '200':
 *         description: Successfully updated actor
 *       '400':
 *         description: Bad request
 *       '404':
 *         description: Not found
 */

router.put('/:actor_id', actorController.updateActor);

module.exports = router;