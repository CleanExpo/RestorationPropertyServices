require('dotenv').config();
const express = require('express');
const cors = require('cors');
const { Pool } = require('pg');

const app = express();
const port = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());

// PostgreSQL connection pool
const pool = new Pool({
  connectionString: process.env.DATABASE_URL
});

// Test DB connection
pool.connect()
  .then(client => {
    console.log('Connected to PostgreSQL');
    client.release();
  })
  .catch(err => console.error('PostgreSQL connection error', err));

const routes = require('./routes');

// Routes
app.use('/api', routes);

app.get('/', (req, res) => {
  res.send('Property Restoration Services API');
});

// Placeholder for future endpoints
// e.g., /locations, /services, /reviews, /gallery, /contact

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
