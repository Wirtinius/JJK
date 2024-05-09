const express = require('express');
const router = express.Router();
const newsController = require('../controller/newsController');

router.post('/', newsController.createNews);
router.get('/', newsController.getAllNews);
router.get('/:news_id', newsController.getNewsById);
router.put('/:news_id', newsController.updateNews);

module.exports = router;
