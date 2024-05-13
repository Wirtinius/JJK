/**
 * @file This file defines the routes related to news items.
 * @description This file contains route definitions for creating, retrieving, updating, and deleting news items.
 */
const express = require('express');
const router = express.Router();
const eventController = require('../controller/eventController');

/**
 * @swagger
 * tags:
 *   name: Events
 *   description: Event management endpoints
 */

/**
 * @swagger
 * /events:
 *   post:
 *     summary: Create a new event
 *     tags: [Events]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Event'
 *     responses:
 *       '200':
 *         description: Successfully created event
 *       '400':
 *         description: Bad request
 */

router.post('/', eventController.createEvent);

/**
 * @swagger
 * /events:
 *   get:
 *     summary: Get all events
 *     tags: [Events]
 *     responses:
 *       '200':
 *         description: Successfully retrieved events
 *       '404':
 *         description: Not found
 */

router.get('/', eventController.getAllEvents);

/**
 * @swagger
 * /events/{event_id}:
 *   get:
 *     summary: Get event by ID
 *     tags: [Events]
 *     parameters:
 *       - in: path
 *         name: event_id
 *         required: true
 *         description: ID of the event to retrieve
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: Successfully retrieved event
 *       '404':
 *         description: Not found
 */

router.get('/:event_id', eventController.getEventById);

/**
 * @swagger
 * /events/{event_id}:
 *   put:
 *     summary: Update event by ID
 *     tags: [Events]
 *     parameters:
 *       - in: path
 *         name: event_id
 *         required: true
 *         description: ID of the event to update
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Event'
 *     responses:
 *       '200':
 *         description: Successfully updated event
 *       '400':
 *         description: Bad request
 *       '404':
 *         description: Not found
 */

router.put('/:event_id', eventController.updateEvent);

module.exports = router;