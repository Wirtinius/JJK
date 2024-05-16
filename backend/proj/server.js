const express = require('express');
const bodyParser = require('body-parser');

const swaggerUi = require('swagger-ui-express');
const swaggerSpec = require('./swagger');  

const connectDB = require('./config/db');

const app = express(); // Define app here

app.use(bodyParser.json());

connectDB();


const actorRoutes = require('./routes/actorRoutes');
const commentRoutes = require('./routes/commentRoutes');
const stuffRoutes = require('./routes/stuffRoutes');
const eventRoutes = require('./routes/eventRoutes');
const newsRoutes = require('./routes/newsRoutes');

app.use('/actors', actorRoutes);
app.use('/comments', commentRoutes);
app.use('/stuffs', stuffRoutes);
app.use('/events', eventRoutes);
app.use('/news', newsRoutes);
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));