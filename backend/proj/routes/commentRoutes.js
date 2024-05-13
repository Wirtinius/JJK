const express = require('express');
const router = express.Router();
const commentController = require('../controller/commentController');

/**
 * @swagger
 * tags:
 *   name: Comments
 *   description: Comment management endpoints
 */

/**
 * @swagger
 * /comments:
 *   post:
 *     summary: Create a new comment
 *     tags: [Comments]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Comment'
 *     responses:
 *       '200':
 *         description: Successfully created comment
 *       '400':
 *         description: Bad request
 */

router.post('/', commentController.createComment);

/**
 * @swagger
 * /comments:
 *   get:
 *     summary: Get all comments
 *     tags: [Comments]
 *     responses:
 *       '200':
 *         description: Successfully retrieved comments
 *       '404':
 *         description: Not found
 */

router.get('/', commentController.getAllComments);

/**
 * @swagger
 * /comments/{comment_id}:
 *   get:
 *     summary: Get comment by ID
 *     tags: [Comments]
 *     parameters:
 *       - in: path
 *         name: comment_id
 *         required: true
 *         description: ID of the comment to retrieve
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: Successfully retrieved comment
 *       '404':
 *         description: Not found
 */

router.get('/:comment_id', commentController.getCommentById);

/**
 * @swagger
 * /comments/{comment_id}:
 *   put:
 *     summary: Update comment by ID
 *     tags: [Comments]
 *     parameters:
 *       - in: path
 *         name: comment_id
 *         required: true
 *         description: ID of the comment to update
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Comment'
 *     responses:
 *       '200':
 *         description: Successfully updated comment
 *       '400':
 *         description: Bad request
 *       '404':
 *         description: Not found
 */

router.put('/:comment_id', commentController.updateComment);

module.exports = router;