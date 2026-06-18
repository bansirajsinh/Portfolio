# MASTER GENERATION PROMPT
## Premium Portfolio Website with MySQL Connectivity

Build a complete modern personal portfolio website using **HTML, CSS, and JavaScript** for the frontend and **Node.js + Express + MySQL** for the backend. The result must visually match the style of the provided screenshots: a **dark theme**, **minimal but premium layout**, **rounded cards**, **white typography**, **purple accent highlights**, **smooth hover states**, and **clean section spacing**.

The website is for a professional developer portfolio and must feel recruiter-ready, client-ready, and polished enough to be used as a real production portfolio.

---

# 1. Core Objective

Create a complete portfolio system that includes:

- Home page
- About page
- Skills page
- Projects page
- Project details page
- Contact page
- MySQL database schema
- Backend APIs
- Contact form submission handling
- Optional admin panel structure
- Responsive mobile experience
- Smooth animations and transitions
- SEO-ready markup
- Clean, maintainable code structure

The website should look like a premium personal branding site and should be strongly inspired by the screenshots provided.

---

# 2. Required Technology Stack

## Frontend
Use only:
- HTML5
- CSS3
- Vanilla JavaScript (ES6+)

Do not rely on heavy UI frameworks for the frontend unless absolutely necessary. Keep the implementation lightweight and easy to understand.

## Backend
Use:
- Node.js
- Express.js

## Database
Use:
- MySQL 8+

## Optional Libraries
You may use:
- dotenv
- mysql2
- bcrypt
- express-validator
- helmet
- cors
- nodemailer
- multer
- jsonwebtoken

---

# 3. Design Requirements

The website must visually follow this style system:

## Theme
- Background: very dark charcoal / near-black
- Cards: slightly lighter dark gray
- Borders: subtle gray
- Accent color: purple / violet
- Text: bright white
- Muted text: soft gray

## Visual Style
- Clean
- Elegant
- Minimal
- Modern
- Premium
- Professional
- Soft shadows
- Rounded corners
- Thin borders
- Subtle glow effect on hover
- No clutter
- No excessive gradients
- No flashy graphics

## Motion
- Smooth scroll
- Fade-in sections
- Slide-up reveal animations
- Button hover lift
- Card hover glow
- Active navbar link underline or highlight
- Theme toggle animation

---

# 4. Information Architecture

Create the following pages:

1. Home
2. About
3. Skills
4. Projects
5. Project Details
6. Contact

Optional future pages:
- Blog
- Testimonials
- Resume
- Admin Dashboard

Each page should use a consistent header and footer.

---

# 5. Home Page Requirements

The home page must have the strongest first impression.

## Header / Navbar
Include:
- Logo or username on the left
- Navigation links on the right:
  - Home
  - Projects
  - Skills
  - About
  - Contact
- Theme toggle icon at the far right

The navbar should:
- Be sticky
- Remain visible while scrolling
- Highlight active page
- Collapse into a mobile menu on small screens

## Hero Section
Build a split layout:
- Left side: text
- Right side: avatar or illustration

### Hero Content
- Greeting line
- Name line
- Professional headline
- Short summary paragraph
- CTA buttons
- Social links

### Example hero copy
- “Hey there, I’m [NAME]”
- “I build modern digital experiences.”
- “Full-Stack Developer | UI-focused | Problem solver”

### Buttons
- View My Work
- Contact Me
- Download Resume

## Additional Home Sections
Add sections such as:

### What I Do
Explain the developer’s core strengths:
- Full-stack development
- Responsive UI design
- API integration
- Performance-focused web apps
- Clean architecture

### Why Me?
Explain strengths such as:
- Strong communication
- Fast debugging
- Reliable delivery
- Pixel-perfect implementation
- Client-first thinking

### Featured Skills
Show pill badges or cards grouped by category:
- Frontend
- Backend
- Database
- Tools
- AI

### Featured Projects
Show 3–6 highlighted projects with:
- Thumbnail
- Title
- Short description
- Technology tags
- GitHub button
- Live demo button

---

# 6. About Page Requirements

Create a detailed About page that feels personal and professional.

## Include:
- Short biography
- Current role
- Education
- Career goals
- Work style
- Strengths
- Soft skills
- Highlights or achievements
- Timeline or career journey

## Recommended About Sections
- Introduction paragraph
- “What I do”
- “Why I build”
- “How I work”
- “Tools I use”
- “My journey”
- “Achievements”

The content should sound confident, warm, and professional.

---

# 7. Skills Page Requirements

The Skills page should clearly organize technical capabilities.

## Skill Categories
- Frontend
- Backend
- Database
- Tools / DevOps
- AI / Automation
- Mobile / App Development
- UI/UX
- Version Control

## Display Format
Use:
- Skill cards
- Badges
- Progress bars
- Category labels
- Icon sections

Each category card should contain:
- Category title
- Short description
- Skill list
- Optional proficiency indicator

## Example Skill Groups
Frontend:
- HTML
- CSS
- JavaScript
- Tailwind
- React
- Next.js

Backend:
- Node.js
- Express.js
- PHP
- REST APIs
- JWT

Database:
- MySQL
- MongoDB
- PostgreSQL
- Firebase

Tools:
- Git
- GitHub
- Postman
- Docker
- Vercel
- Netlify

AI:
- OpenAI
- LangChain
- Prompt Engineering

---

# 8. Projects Page Requirements

The Projects page should be one of the most visually strong sections.

## Project Card Requirements
Each project card must include:
- Project title
- Short summary
- Tech stack tags
- Cover image
- GitHub repository link
- Live demo link
- Details button

## Filtering
Add optional project filters:
- All
- Frontend
- Backend
- Full Stack
- Mobile
- AI
- UI/UX

## Sorting
Featured projects should appear first.

## Layout
- Desktop: 3-column grid
- Tablet: 2-column grid
- Mobile: 1-column stacked cards

---

# 9. Project Details Page Requirements

Create a dynamic project details page that can load data from MySQL through the backend.

## Include:
- Project title
- Project banner image
- Full description
- Problem statement
- Solution summary
- Feature list
- Technology stack
- My role
- Architecture explanation
- Database summary
- GitHub link
- Live demo link
- Screenshots gallery
- Challenges
- Lessons learned
- Future improvements

This page should make each project look like a serious case study.

---

# 10. Contact Page Requirements

Create a modern contact page with a polished form card.

## Form Fields
- Full Name
- Email
- Subject
- Message

## Optional Fields
- Phone number
- Company
- Budget
- Project type

## Behavior
- Validate all required fields
- Show clear inline errors
- Store data in MySQL
- Display success message after submission
- Prevent duplicate accidental submissions
- Show loading state while sending

## Optional backend action
- Send email notification to the site owner

---

# 11. Footer Requirements

The footer should include:
- Name
- Short tagline
- Navigation links
- Social links
- Email address
- Copyright text
- Optional back-to-top button

---

# 12. Database Requirements

Use MySQL with a clean relational structure.

## Tables to Create
- site_profile
- social_links
- navigation_items
- skill_categories
- skills
- education
- experience
- certifications
- project_categories
- projects
- technologies
- project_technologies
- project_images
- project_links
- testimonials
- contact_messages
- site_settings
- blog_posts
- admin_users
- visitors
- page_views

## Database Rules
- Use primary keys
- Use foreign keys
- Use unique slugs for SEO-friendly routing
- Use created_at and updated_at fields
- Use indexes for frequent lookups
- Use utf8mb4 character encoding
- Use InnoDB engine

## Data Flow
- Frontend sends requests to backend API
- Backend validates input
- Backend uses prepared statements
- Backend stores and retrieves data from MySQL
- Backend returns JSON responses

---

# 13. Backend API Requirements

Create RESTful endpoints similar to the following:

- GET /api/profile
- GET /api/social-links
- GET /api/navigation
- GET /api/skills
- GET /api/education
- GET /api/experience
- GET /api/certifications
- GET /api/projects
- GET /api/projects/:slug
- GET /api/projects/featured
- POST /api/contact
- GET /api/site-settings

Optional admin endpoints:
- POST /api/admin/login
- POST /api/admin/projects
- PUT /api/admin/projects/:id
- DELETE /api/admin/projects/:id
- POST /api/admin/skills
- PUT /api/admin/skills/:id
- DELETE /api/admin/skills/:id

---

# 14. Folder Structure Requirement

Generate a clean file structure similar to this:

```text
portfolio-website/
├── index.html
├── about.html
├── skills.html
├── projects.html
├── project-details.html
├── contact.html
├── assets/
├── css/
├── js/
├── backend/
├── docs/
└── README.md
```

Inside the backend:
- config/
- routes/
- controllers/
- models/
- middleware/
- utils/

---

# 15. Responsive Design Requirements

The site must be fully responsive.

## Mobile Behavior
- Navbar becomes hamburger menu
- Hero stacks vertically
- Cards become single column
- Buttons remain easy to tap
- Text remains readable without zooming

## Tablet Behavior
- Layout should adjust gracefully
- Cards should fit neatly
- Spacing should stay balanced

## Desktop Behavior
- Large hero section
- Two-column or three-column layouts
- Well-spaced cards and sections

---

# 16. Accessibility Requirements

The website must be accessible.

Include:
- Semantic HTML
- Proper heading hierarchy
- Good contrast
- Visible focus states
- Form labels
- Alt text for all meaningful images
- Keyboard navigation support

---

# 17. SEO Requirements

Optimize the site for search engines.

## Add:
- Title tags
- Meta descriptions
- Open Graph data
- Twitter cards
- Canonical URLs
- Structured data for person/profile
- Friendly slugs
- Image alt text
- Semantic content structure

---

# 18. Security Requirements

If backend forms and admin access are included, implement:

- Input sanitization
- SQL injection prevention with prepared statements
- Password hashing with bcrypt
- JWT or session-based auth for admin login
- Rate limiting on public endpoints
- Helmet security headers
- CORS configuration
- Environment variables for secrets

---

# 19. Content Rules

Use placeholders where final personal details are not yet available.

Replace:
- [NAME]
- [ROLE]
- [EMAIL]
- [PHONE]
- [LOCATION]
- [GITHUB URL]
- [LINKEDIN URL]
- [RESUME LINK]
- [PROJECT NAME]
- [PROJECT DESCRIPTION]
- [TECH STACK]

---

# 20. Data Mapping Requirements

The AI should generate code that clearly maps database data to UI sections:

- site_profile → hero and about summary
- social_links → header/footer social icons
- skill_categories + skills → skills page
- projects + project_categories + project_technologies + project_images + project_links → projects page and project details page
- education → about / timeline
- experience → about / timeline
- certifications → about / achievements
- contact_messages → contact form submissions
- site_settings → SEO and global display settings

---

# 21. Required Output from the AI

Generate:
1. Complete frontend pages in HTML/CSS/JS
2. Complete backend in Node/Express
3. Full MySQL schema
4. Sample seed data
5. API route files
6. Database config file
7. Validation middleware
8. Clean project folder structure
9. Detailed README
10. Deployment instructions
11. Responsive and animated user interface
12. Premium dark mode visuals
13. Reusable components
14. Easy-to-edit content structure

---

# 22. Final Quality Standard

The final website must look:
- Premium
- Modern
- Elegant
- Real
- Recruiter-ready
- Client-ready
- Mobile-friendly
- Production-ready

The design should closely match the visual mood of the reference screenshots:
- Dark background
- White headings
- Purple accent
- Rounded cards
- Simple but rich layout
- Neat spacing
- Clear hierarchy
- Subtle motion

Do not make the interface look generic or overly colorful. Keep it calm, premium, and confident.
