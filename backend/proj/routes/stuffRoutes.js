const express = require('express');
const router = express.Router();
const stuffController = require('../controller/stuffController');

router.post('/', stuffController.createStuff);
router.get('/', stuffController.getAllStuff);
router.get('/:stuff_id', stuffController.getStuffById);
router.put('/:stuff_id', stuffController.updateStuff);

module.exports = router;

