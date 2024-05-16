/**
 * @file This file defines the routes related to news items.
 * @description This file contains route definitions for creating, retrieving, updating, and deleting news items.
 */
const express = require('express');
const router = express.Router();
const newsController = require('../controller/newsController');

/**
 * @swagger
 * tags:
 *   name: News
 *   description: News management endpoints
 */

/**
 * @swagger
 * /news:
 *   post:
 *     summary: Create a new news
 *     tags: [News]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/News'
 *     responses:
 *       '200':
 *         description: Successfully created news
 *       '400':
 *         description: Bad request
 */

router.post('/', newsController.createNews);

/**
 * @swagger
 * /news:
 *   get:
 *     summary: Get all news
 *     tags: [News]
 *     responses:
 *       '200':
 *         description: Successfully retrieved news
 *       '404':
 *         description: Not found
 */

router.get('/', newsController.getAllNews);

/**
 * @swagger
 * /news/{news_id}:
 *   get:
 *     summary: Get news by ID
 *     tags: [News]
 *     parameters:
 *       - in: path
 *         name: news_id
 *         required: true
 *         description: ID of the news to retrieve
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: Successfully retrieved news
 *       '404':
 *         description: Not found
 */

router.get('/:news_id', newsController.getNewsById);

/**
 * @swagger
 * /news/{news_id}:
 *   put:
 *     summary: Update news by ID
 *     tags: [News]
 *     parameters:
 *       - in: path
 *         name: news_id
 *         required: true
 *         description: ID of the news to update
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/News'
 *     responses:
 *       '200':
 *         description: Successfully updated news
 *       '400':
 *         description: Bad request
 *       '404':
 *         description: Not found
 */

router.put('/:news_id', newsController.updateNews);

module.exports = router;