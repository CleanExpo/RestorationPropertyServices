-- PostgreSQL schema for Property Restoration Services

CREATE TABLE locations (
  id SERIAL PRIMARY KEY,
  suburb VARCHAR(100) NOT NULL,
  state VARCHAR(10) DEFAULT 'QLD',
  UNIQUE(suburb, state)
);

CREATE TABLE services (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE location_services (
  id SERIAL PRIMARY KEY,
  location_id INTEGER REFERENCES locations(id) ON DELETE CASCADE,
  service_id INTEGER REFERENCES services(id) ON DELETE CASCADE,
  h1 TEXT,
  meta_description TEXT,
  first_paragraph TEXT
);

CREATE TABLE reviews (
  id SERIAL PRIMARY KEY,
  location_id INTEGER REFERENCES locations(id) ON DELETE SET NULL,
  author VARCHAR(100),
  rating INTEGER CHECK (rating >= 1 AND rating <= 5),
  content TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE images (
  id SERIAL PRIMARY KEY,
  url TEXT NOT NULL,
  description TEXT,
  attribution TEXT,
  location_id INTEGER REFERENCES locations(id) ON DELETE SET NULL,
  service_id INTEGER REFERENCES services(id) ON DELETE SET NULL
);

CREATE TABLE enquiries (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(20),
  message TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
