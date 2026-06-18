# Bansirajsinh Gohil — Portfolio Website

A premium, dark-themed personal portfolio website built with **HTML/CSS/JS** frontend and **Node.js + Express + MySQL** backend.

## ✨ Features

- **Dark theme** with green accent color scheme
- **6 pages**: Home, About, Skills, Projects, Project Details, Contact
- **Fully responsive** — mobile, tablet, and desktop
- **RESTful API** with 10+ endpoints
- **MySQL database** with 20 tables and relational integrity
- **Contact form** with Nodemailer (sends emails directly to Gmail)
- **Scroll animations** and smooth transitions
- **Minimalist, premium design** inspired by modern portfolio sites

## 🚀 Quick Start

### Prerequisites

- **Node.js** v18+
- **MySQL** 8+
- **npm**

### 1. Set Up Database

```bash
mysql -u root -p < schema.sql
mysql -u root -p portfolio_db < seed.sql
```

### 2. Configure Environment

Edit `backend/.env` with your credentials:

```env
DB_USER=root
DB_PASSWORD=your_mysql_password

# For contact form email sending:
SMTP_USER=gohilbansirajsinh@gmail.com
SMTP_PASS=your_gmail_app_password
```

> **Gmail App Password**: Go to [Google Account](https://myaccount.google.com/) → Security → 2-Step Verification → App passwords → Generate one for "Mail".

### 3. Install & Run

```bash
cd backend
npm install
npm start
```

Visit: **http://localhost:3000**

## 📁 Folder Structure

```
Portfolio/
├── html/               ← All HTML pages
│   ├── index.html
│   ├── about.html
│   ├── skills.html
│   ├── projects.html
│   ├── project-details.html
│   └── contact.html
├── css/                ← Stylesheets
│   ├── style.css       (design tokens & base)
│   ├── components.css  (cards, buttons, forms)
│   ├── animations.css  (scroll reveals, keyframes)
│   └── responsive.css  (media queries)
├── js/                 ← Frontend JavaScript
│   ├── api.js          (reusable API client)
│   ├── app.js          (navbar, scroll, global)
│   ├── home.js
│   ├── projects.js
│   ├── project-details.js
│   ├── skills.js
│   └── contact.js
├── backend/            ← Node.js + Express
│   ├── server.js
│   ├── app.js
│   ├── .env
│   ├── config/db.js
│   ├── api/            (route files)
│   ├── controllers/
│   ├── middleware/
│   ├── models/
│   └── utils/
├── schema.sql          ← Database schema
├── seed.sql            ← Sample data
└── README.md
```

## 📡 API Endpoints

| Method | Endpoint               | Description           |
|--------|------------------------|-----------------------|
| GET    | /api/profile           | Site profile data     |
| GET    | /api/skills            | Skills by category    |
| GET    | /api/projects          | All projects          |
| GET    | /api/projects/featured | Featured projects     |
| GET    | /api/projects/:slug    | Single project        |
| GET    | /api/education         | Education timeline    |
| GET    | /api/experience        | Work experience       |
| GET    | /api/certifications    | Certifications        |
| GET    | /api/social-links      | Social media links    |
| GET    | /api/navigation        | Navigation items      |
| GET    | /api/site-settings     | Site settings         |
| POST   | /api/contact           | Submit contact form   |
| GET    | /api/health            | Health check          |

## 🎨 Design System

- **Background**: `#0a0a0a` (near-black)
- **Cards**: `#141414` (dark surface)
- **Accent**: `#22c55e` (green)
- **Text**: `#f0f0f0` (white)
- **Fonts**: Inter (body), Outfit (headings)

## 📧 Contact Form Email

The contact form:
1. **Validates** input (client + server side)
2. **Stores** the message in MySQL `contact_messages` table
3. **Sends an email** to your Gmail via Nodemailer SMTP
4. **Rate limits** submissions (5 per 15 minutes)

## 🔒 Security

- Helmet security headers
- CORS configuration
- Input validation with express-validator
- Prepared SQL statements (no SQL injection)
- Rate limiting on public endpoints
- Environment variables for secrets

## 📝 License

MIT © Bansirajsinh Gohil
