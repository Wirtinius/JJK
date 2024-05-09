const mongoose = require('mongoose');

const stuffSchema = new mongoose.Schema({
  full_name: {
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

module.exports = mongoose.model('Stuff', stuffSchema);
