const mongoose = require('mongoose');

const actorSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  bio: {
    type: String,
    required: false
  },
  image: {
    type: String,
    required: false
  }
}, { timestamps: true });

module.exports = mongoose.model('Actor', actorSchema);
