const express = require('express');
const router = express.Router();
const stuffController = require('../controller/stuffController');

/**
 * @swagger
 * tags:
 *   name: Stuff
 *   description: Stuff management endpoints
 */

/**
  * @swagger
  * /news:
  *   post:
  *     summary: Create a new news item.
  *     description: Endpoint to create a new news item.
  *     requestBody:
  *       required: true
  *       content:
  *         application/json:
  *           schema:
  *             $ref: '#/components/schemas/News'
  *     responses:
  *       201:
  *         description: Successfully created a new news item.
  *       500:
  *         description: Internal Server Error.
  */
router.post('/', stuffController.createStuff);

/**
 * @swagger
 * /stuff:
 *   get:
 *     summary: Get all stuff
 *     description: Retrieve a list of all stuff entries
 *     tags: [Stuff]
 *     responses:
 *       '200':
 *         description: Successfully retrieved stuff
 *       '404':
 *         description: Not found
 */
router.get('/', stuffController.getAllStuff);

/**
 * @swagger
 * /stuff/{stuff_id}:
 *   get:
 *     summary: Get stuff by ID
 *     description: Retrieve a stuff entry by its ID
 *     tags: [Stuff]
 *     parameters:
 *       - in: path
 *         name: stuff_id
 *         required: true
 *         description: ID of the stuff to retrieve
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: Successfully retrieved stuff
 *       '404':
 *         description: Not found
 */
router.get('/:stuff_id', stuffController.getStuffById);

/**
 * @swagger
 * /stuff/{stuff_id}:
 *   put:
 *     summary: Update stuff by ID
 *     description: Update a stuff entry by its ID
 *     tags: [Stuff]
 *     parameters:
 *       - in: path
 *         name: stuff_id
 *         required: true
 *         description: ID of the stuff to update
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Stuff'
 *     responses:
 *       '200':
 *         description: Successfully updated stuff
 *       '400':
 *         description: Bad request
 *       '404':
 *         description: Not found
 */
router.put('/:stuff_id', stuffController.updateStuff);

module.exports = router;