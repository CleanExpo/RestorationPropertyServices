# Property Restoration Services

A full-stack web application for a property restoration company offering water, fire, mould, biohazard, sewage, and cleaning services across Queensland.

---

## Tech Stack

- **Backend:** Node.js (v18.18.0), Express.js
- **Database:** PostgreSQL
- **Frontend:** React or Next.js (planned)
- **ORM:** pg (native driver), optional Sequelize or Knex
- **Dev Tools:** nodemon, dotenv, cors

---

## Folder Structure

```
Property Restoration Services/
├── backend/
│   ├── package.json
│   ├── index.js
│   ├── .env (not committed)
│   └── (future: routes/, controllers/, models/)
├── database/
│   └── schema.sql
├── frontend/
│   └── (React or Next.js app)
├── Location_Service_Content/
│   └── all_locations_services.csv
├── README.md
```

---

## Database Schema

- **locations:** suburb, state
- **services:** service name
- **location_services:** join table with H1, meta description, paragraph
- **reviews:** customer reviews linked to locations
- **images:** gallery images linked to locations/services
- **enquiries:** contact form submissions

See `database/schema.sql` for full SQL.

---

## API Endpoints (Planned)

- `GET /locations` — list all locations
- `GET /services` — list all services
- `GET /location-services?location=&service=` — get content for a location/service
- `GET /reviews?location=` — get reviews
- `POST /reviews` — submit a review
- `GET /gallery?location=&service=` — get images
- `POST /contact` — submit an enquiry

---

## Frontend (Planned)

- **Homepage:** hero, services, service area map, reviews, gallery, contact form
- **Location/Service Pages:** generated from CSV/database
- **Gallery:** filterable images
- **Reviews:** display and submit
- **Contact:** form with validation

---

## Development Workflow

1. **Setup PostgreSQL:**
   - Create database `property_restoration`
   - Run `schema.sql`
   - Import CSV data into tables

2. **Backend:**
   - Configure `.env` with `DATABASE_URL`
   - Run `npm install` in `backend/`
   - Start server: `npm run dev`

3. **Frontend:**
   - Scaffold React/Next.js app
   - Connect to backend API
   - Build pages and components

4. **Admin Panel (optional):**
   - Manage content, reviews, images, enquiries

---

## Deployment Notes

- Use environment variables for secrets
- Enable HTTPS
- Use CDN for static assets
- Regularly backup database
- Monitor logs and errors

---

## Company Info

**Property Restoration Services**  
Emergency property restoration across Queensland  
Water, fire, mould, biohazard, sewage, cleaning  
24/7 rapid response

---

This README serves as a **boomerang** to keep development focused and aligned with the project goals.
