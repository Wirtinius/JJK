const express = require('express');
const bodyParser = require('body-parser');
const actorRoutes = require('./routes/actorRoutes');
const commentRoutes = require('./routes/commentRoutes');
const stuffRoutes = require('./routes/stuffRoutes');
const eventRoutes = require('./routes/eventRoutes');
const newsRoutes = require('./routes/newsRoutes');

const connectDB = require('./config/db');

const app = express();

connectDB();

app.use(express.json()); 

app.use('/actors', actorRoutes);
app.use('/comments', commentRoutes);
app.use('/stuffs', stuffRoutes);
app.use('/events', eventRoutes);
app.use('/news', newsRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
