const mongoose = require('mongoose');

const newsSchema = new mongoose.Schema({
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

module.exports = mongoose.model('News', newsSchema);
