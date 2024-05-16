const swaggerJSDoc = require('swagger-jsdoc');

const swaggerOptions = {
    definition: {
        openapi: '3.0.0',
        info: {
            title: 'JJK API',
            version: '1.0.0',
            description: 'JJK API',
        },
        servers: [
            {
                url: 'http://localhost:3000',
                description: 'Development Server',
            },
        ],
    },
    apis: ['proj/routes/*.js'],
  };

const swaggerSpec = swaggerJSDoc(swaggerOptions);

module.exports = swaggerSpec;