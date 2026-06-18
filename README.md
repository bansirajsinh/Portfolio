# Bansirajsinh Gohil — Premium Portfolio

Welcome to my personal portfolio! This is a dark-themed, minimalist, and fully responsive website that showcases my skills, experience, and projects. It features a complete **HTML/CSS/JS** frontend powered by a robust **Node.js/Express** backend and a **MySQL** database.

---

## 📖 Project Description

This project was built from scratch to provide a visually stunning, premium-feel portfolio that is highly customizable and easy to maintain. 
The design system focuses on a sleek near-black background (`#0a0a0a`) combined with vibrant green accents (`#22c55e`). 

The goal is to provide a seamless user experience across all devices (mobile, tablet, desktop) while ensuring that all content is driven dynamically from the backend API.

### Key Features:
- **Dynamic Content**: Skills, projects, and profile data are fetched from a MySQL database.
- **Direct Email Integration**: The contact page allows users to send messages directly to my Gmail.
- **Scroll Animations**: Smooth entrance animations for all sections.
- **Fully Responsive**: Tailored layouts for varying screen sizes.
- **RESTful API**: Custom backend architecture handling routing, database queries, and email processing.

---

## 📸 Page Previews & User Flow

Here is a detailed walkthrough of the user flow across the main pages of the portfolio:

### 1. Home Page
**User Flow:** This is the landing page. Users are greeted with a striking hero section containing my profile picture, name, a brief intro, and call-to-action buttons (View Projects, Contact Me). As users scroll down, elements gracefully fade in. They can use the top navigation bar to seamlessly jump to other sections.

![Home Page](./Screenshots/Screenshot%202026-06-18%20235939.png)

### 2. Projects Page
**User Flow:** Users navigate here to view my complete portfolio of work. The page dynamically fetches all projects from the database and displays them in beautifully styled cards. Users can filter projects by categories (e.g., Web, Mobile) and click on individual projects to view their detailed pages.

![Projects Page](./Screenshots/Screenshot%202026-06-19%20000042.png)

### 3. About Page
**User Flow:** This section provides a deeper dive into my background, education, and work experience. It presents a chronological timeline of my journey, fetched from the backend, allowing recruiters to quickly understand my professional history.

![About Page](./Screenshots/Screenshot%202026-06-18%20235957.png)

### 4. Skills Page
**User Flow:** Displays a categorized list of my technical skills (Frontend, Backend, Tools, etc.). Each skill includes an animated progress bar. This visual representation helps visitors grasp my core competencies instantly.

![Skills Page](./Screenshots/Screenshot%202026-06-19%20000024.png)

### 5. Contact Page
**User Flow:** If a user wants to get in touch, they use the contact form. They fill in their Name, Email, Subject, and Message. Upon clicking "Send Message", the form is validated. If successful, the backend saves the message to the database and automatically forwards it to my Gmail address. The user receives a success toast notification. There is also a "Direct Email" button to open the default mail client.

![Contact Page](./Screenshots/Screenshot%202026-06-19%20005530.png)

**Message Confirmation Example:**
*(Below is the successful message submission state, e.g., when "Sarah" sends a message)*
![Message Success](./Screenshots/Screenshot%202026-06-19%20005538.png)

*(Note: The mobile responsive views are also fully optimized and adapt to smaller screens seamlessly, ensuring perfect readability and touch targets).*

---

## 🗺️ Complete User Flow Summary

1. **Arrival**: The user lands on the `index.html` (Home) page, welcomed by the Hero section and animated UI.
2. **Exploration**: The user uses the fixed navbar to navigate to **About**, **Skills**, or **Projects**.
3. **Deep Dive**: On the Projects page, the user filters projects and clicks one to open `project-details.html`, which fetches specific project data via the API (`/api/projects/:slug`).
4. **Action/Conversion**: After reviewing the portfolio, the user navigates to the **Contact** page.
5. **Submission**: The user submits a form. The frontend JS (`js/contact.js`) validates the inputs and sends a POST request to `/api/contact`. 
6. **Backend Processing**: The Node.js server validates the request, saves the record to MySQL, and uses Nodemailer to send an email to the admin.
7. **Confirmation**: The user sees a success toast, completing the interactive loop.

---

## 📁 File Structure Explained

The project is logically separated into frontend and backend directories for clean organization:

```text
Portfolio/
├── html/               ← All frontend structural markup
│   ├── index.html      (Landing page)
│   ├── about.html      (Experience and education)
│   ├── skills.html     (Technical skills breakdown)
│   ├── projects.html   (Project gallery)
│   ├── project-details.html (Individual project view)
│   └── contact.html    (Contact form)
│
├── css/                ← Modular Stylesheets
│   ├── style.css       (Global variables, typography, resets)
│   ├── components.css  (Reusable UI cards, buttons, inputs)
│   ├── animations.css  (Scroll reveals, hover keyframes)
│   └── responsive.css  (Media queries for mobile/tablet)
│
├── js/                 ← Frontend JavaScript Logic
│   ├── api.js          (Global fetch wrapper to talk to backend)
│   ├── app.js          (Navbar toggle, scroll listeners, global UI)
│   ├── home.js         (Home specific logic)
│   ├── projects.js     (Project fetching and filtering)
│   ├── project-details.js (Dynamic project data rendering)
│   ├── skills.js       (Skills progress bar animations)
│   └── contact.js      (Form validation and API submission)
│
├── backend/            ← Node.js + Express API Server
│   ├── server.js       (Entry point, starts the server)
│   ├── app.js          (Express app setup, middleware, routing)
│   ├── .env            (Environment secrets like DB/Email passwords)
│   ├── config/         (Database connection logic)
│   ├── api/            (Express route definitions per feature)
│   ├── controllers/    (Business logic handling requests/responses)
│   ├── middleware/     (Error handling, rate limiting, validation)
│   ├── models/         (Database interaction wrappers)
│   └── utils/          (Helpers like Nodemailer configuration)
│
├── schema.sql          ← SQL commands to create all database tables
├── seed.sql            ← SQL commands to insert initial sample data
├── deployment_guide.md ← Step-by-step instructions for hosting
└── README.md           ← This documentation file
```

---

## 🚀 Quick Start Guide

### Prerequisites
- **Node.js** v18+
- **MySQL** 8+

### 1. Database Setup
Log into your local MySQL instance and run the schema and seed scripts:
```bash
mysql -u root -p < schema.sql
mysql -u root -p portfolio_db < seed.sql
```

### 2. Environment Configuration
Edit `backend/.env` with your local database and email credentials:
```env
DB_USER=root
DB_PASSWORD=your_mysql_password
SMTP_USER=gohilbansirajsinh@gmail.com
SMTP_PASS=your_gmail_app_password
```

### 3. Start the Server
```bash
cd backend
npm install
npm start
```
Visit **http://localhost:3000** in your browser.

---

## 🔒 Security Measures
- **Helmet**: Secures HTTP headers.
- **CORS**: Prevents unauthorized cross-origin requests.
- **Rate Limiting**: Prevents API spam (e.g., 5 contact submissions per 15 mins).
- **Prepared Statements**: Prevents SQL injection attacks across the app.

---
*Developed with focus on clean architecture, modern aesthetics, and performance.*
