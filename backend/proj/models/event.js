const mongoose = require('mongoose');

const eventSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  date: {
    type: Date,
    required: false
  },
  image: {
    type: String,
    required: false
  }
}, { timestamps: true });

module.exports = mongoose.model('Event', eventSchema);
