# Importing CSV Data into PostgreSQL

## 1. Prepare the CSV

Ensure your CSV (`all_locations_services.csv`) is saved and accessible.

## 2. Create the database

```sql
CREATE DATABASE property_restoration;
```

## 3. Run schema

```sql
\c property_restoration
\i schema.sql
```

## 4. Import locations and services

### Import unique suburbs

```sql
COPY temp_import(suburb, service, h1, meta_description, first_paragraph)
FROM '/path/to/all_locations_services.csv' WITH CSV HEADER;

INSERT INTO locations (suburb)
SELECT DISTINCT suburb FROM temp_import
ON CONFLICT DO NOTHING;

INSERT INTO services (name)
SELECT DISTINCT service FROM temp_import
ON CONFLICT DO NOTHING;
```

### Import location_services content

```sql
INSERT INTO location_services (location_id, service_id, h1, meta_description, first_paragraph)
SELECT
  l.id,
  s.id,
  t.h1,
  t.meta_description,
  t.first_paragraph
FROM temp_import t
JOIN locations l ON l.suburb = t.suburb
JOIN services s ON s.name = t.service;
```

## 5. Cleanup

```sql
DROP TABLE temp_import;
```

---

## Notes

- Adjust `/path/to/all_locations_services.csv` to your file path.
- You may need to create `temp_import` table:

```sql
CREATE TABLE temp_import (
  suburb VARCHAR,
  service VARCHAR,
  h1 TEXT,
  meta_description TEXT,
  first_paragraph TEXT
);
```

- Use `psql` or a GUI like pgAdmin to run these commands.
