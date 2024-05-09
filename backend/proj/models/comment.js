const mongoose = require('mongoose');

const commentSchema = new mongoose.Schema({
  text: {
    type: String,
    required: true
  },
  rating: {
    type: Number,
    required: true
  },
}, { timestamps: true });

module.exports = mongoose.model('Comment', commentSchema);
