const mongoose = require('mongoose');
require('dotenv').config();

const connectDB = async () => {
    mongoose
        .connect("mongodb+srv://Alen:Infinitive3@jjk.eaq1uka.mongodb.net/", {
        useNewUrlParser: true,
        useUnifiedTopology: true,
    })
        .then(() => {
        console.log("DB Connetion Successfull");
    })
        .catch((err) => {
        console.log(err.message);
    });

};

module.exports = connectDB;
