USE portfolio_db;

-- ---- Site Profile ----
INSERT INTO site_profile (full_name, headline, short_bio, long_bio, email, github_url, linkedin_url, location, resume_url) VALUES
('Gohil Bansirajsinh Pradipsinh',
 'Flutter Developer | Full Stack Developer | Blockchain Enthusiast',
 'Information Technology student with hands-on experience in Flutter, full-stack web development, Firebase, MySQL, and blockchain technologies.',
 'I am an Information Technology student from Bhavnagar, Gujarat, currently pursuing my B.E. at Shantilal Shah Engineering College (GTU). I specialize in building cross-platform mobile apps with Flutter, full-stack web applications with Node.js/Express/MySQL, and blockchain-based solutions. I have completed internships in Flutter and Java development, built multiple real-world projects, and participated in several hackathons. My focus is on clean, maintainable code — from elegant UI/UX to rock-solid backend systems.',
 'gohilbansirajsinh@gmail.com',
 'https://github.com/bansirajsinh',
 'https://linkedin.com/in/bansirajsinh-gohil',
 'Bhavnagar, Gujarat, India',
 NULL
);

-- ---- Skill Categories ----
INSERT INTO skill_categories (category_name, icon, display_order) VALUES
('Mobile Development', 'fa-mobile-screen', 1),
('Frontend Development', 'fa-code', 2),
('Backend Development', 'fa-server', 3),
('Databases', 'fa-database', 4),
('Blockchain', 'fa-link', 5);

-- ---- Technologies (Skills) ----
INSERT INTO technologies (technology_name, category_id, proficiency, display_order) VALUES
('Flutter', 1, 90, 1),
('Dart', 1, 88, 2),
('HTML5', 2, 92, 1),
('CSS3', 2, 90, 2),
('JavaScript', 2, 85, 3),
('Bootstrap 5', 2, 80, 4),
('Node.js', 3, 85, 1),
('Express.js', 3, 83, 2),
('AdonisJS v6', 3, 70, 3),
('TypeScript', 3, 65, 4),
('MySQL', 4, 85, 1),
('Firebase Firestore', 4, 82, 2),
('Firebase Auth', 4, 80, 3),
('Ethereum / Solidity', 5, 60, 1),
('Web3.dart', 5, 55, 2);

-- ---- Project Categories ----
INSERT INTO project_categories (category_name, category_slug, sort_order) VALUES
('Blockchain', 'blockchain', 1),
('Mobile', 'mobile', 2),
('Full Stack', 'full-stack', 3),
('Frontend', 'frontend', 4);

-- ---- Projects ----
INSERT INTO projects (title, slug, short_description, full_description, category_id, featured, github_url, live_url, display_order) VALUES
(
  'E-Voting System Using Blockchain',
  'e-voting-blockchain',
  'Secure, transparent, tamper-proof digital voting using Flutter, Firebase, Ethereum, and Solidity with SHA-256 hashing.',
  'The E-Voting System is a secure digital voting platform combining Flutter mobile technology with blockchain-based vote recording. It preserves integrity, accountability, authentication, anonymity, and verifiability. Votes are recorded on the Ethereum blockchain using smart contracts, while Firebase handles user profiles and application data off-chain. SHA-256 hashing and salt-based security prevent tampering. Features include voter registration with identity verification, OTP access control, candidate listing, election dashboard, vote casting with blockchain confirmation, voting history, results display, and admin management panels.',
  1,
  1,
  'https://github.com/bansirajsinh/Evoting-App',
  NULL,
  1
),
(
  'Inventory Management System',
  'inventory-management',
  'Flutter mobile app with Firebase for real-time stock tracking, item management, search, favorites, and low-stock monitoring.',
  'A professional mobile application designed for small businesses, retail shops, grocery stores, warehouses, and medical stores to manage stock digitally. Replaces manual stock registers with a structured, real-time, mobile-first solution. Features include adding/editing/deleting inventory items, product image upload, stock quantity tracking with plus/minus controls, Firebase real-time sync, search by name and category, favorites marking, low-stock awareness alerts, category and supplier organization, and stock summary reporting.',
  2,
  1,
  'https://github.com/bansirajsinh/stockify',
  NULL,
  2
),
(
  'Chitrakar Gohil Website',
  'chitrakar-gohil',
  'Full-stack heritage website for the Gohil family art business using AdonisJS v6, MySQL, and Leaflet.js.',
  'A full-stack website created to showcase the artistic legacy and business identity of the Gohil family from Bhavnagar, Gujarat, highlighting over 80 years of art across multiple generations. Built with AdonisJS v6, Lucid ORM, MySQL, and Edge.js for server-side rendering. Features include a hero section with legacy tagline, about section for family artists (Chitrakar Kishorsinh, Pradipkumar, Indravijaysinh), artwork gallery with filters, featured paintings section including a heritage 1946 painting, timeline milestones, contact form with database submission, and Leaflet.js map integration.',
  3,
  1,
  'https://github.com/bansirajsinh/Chitrakar_Gohil.git',
  NULL,
  3
),
(
  'Social Media Platform',
  'social-media-platform',
  'Full-stack social networking app with feeds, posts, comments, likes, followers, messaging, and notifications.',
  'A complete full-stack web application supporting user interaction, posting, commenting, liking, following, messaging, notifications, search, and profile management. Built with Node.js, Express.js, MySQL, JWT, and bcryptjs. Features include user registration/login, profile pages with bio and image support, post creation and display, likes and comments with nested replies, follow/unfollow flow, notification system, search for users/posts/hashtags, trending content section, and a messaging module. JWT-based authentication and bcryptjs password hashing ensure security.',
  3,
  0,
  'https://github.com/bansirajsinh/CodeAlpha_SocialMediaPlatform',
  NULL,
  4
),
(
  'E-Commerce Store',
  'ecommerce-store',
  'Full-stack shopping application with product browsing, cart management, authentication, and order processing.',
  'A full-stack e-commerce application including product browsing, cart operations, user authentication, order handling, and administrative product management. Built with Node.js, Express.js, MySQL, JWT, and bcryptjs. Features include product listing pages, product details view, cart management with add/remove/update, checkout and order workflow, user registration and login, order history, product administration panel, and category organization. Demonstrates transactional application logic and database-driven commerce behavior.',
  3,
  0,
  'https://github.com/bansirajsinh/CodeAlpha_Ecommerce',
  NULL,
  5
),
(
  'StreetFixer',
  'streetfixer',
  'Civic issue reporting app for potholes and road damage with image capture, GPS location, and Firebase backend.',
  'StreetFixer is a civic issue reporting mobile application that allows citizens to report potholes and road-damage issues by submitting photos and location data. Built with Flutter, Dart, Firebase, and Location Services. Features include a complaint submission form, image capture/upload, GPS-based location tagging, issue category selection, status tracking, Firebase-backed persistence, user-friendly complaint history, and a civic reporting workflow. The app makes road issue reporting faster, more structured, and easier to track.',
  2,
  0,
  NULL,
  NULL,
  6
);

-- ---- Project Technologies (linking projects to technologies) ----
-- E-Voting (project 1)
INSERT INTO project_technologies (project_id, technology_id) VALUES
(1, 1), (1, 2), (1, 13), (1, 14), (1, 15);
-- Inventory (project 2)
INSERT INTO project_technologies (project_id, technology_id) VALUES
(2, 1), (2, 2), (2, 12), (2, 13);
-- Chitrakar (project 3)
INSERT INTO project_technologies (project_id, technology_id) VALUES
(3, 3), (3, 4), (3, 5), (3, 9), (3, 11);
-- Social Media (project 4)
INSERT INTO project_technologies (project_id, technology_id) VALUES
(4, 3), (4, 4), (4, 5), (4, 7), (4, 8), (4, 11);
-- E-Commerce (project 5)
INSERT INTO project_technologies (project_id, technology_id) VALUES
(5, 3), (5, 4), (5, 5), (5, 7), (5, 8), (5, 11);
-- StreetFixer (project 6)
INSERT INTO project_technologies (project_id, technology_id) VALUES
(6, 1), (6, 2), (6, 12), (6, 13);

-- ---- Education ----
INSERT INTO education (degree, institution, university, start_year, end_year, grade, description, display_order) VALUES
('B.E. in Information Technology', 'Shantilal Shah Engineering College', 'Gujarat Technological University', '2024', NULL, 'Pursuing', 'Currently pursuing Bachelor of Engineering in IT with focus on web technologies, mobile development, and software engineering.', 1),
('Diploma in Information Technology', 'Gyan Manjari Diploma Engineering College', 'Gujarat Technological University', '2021', '2024', '87.2%', 'Completed diploma with strong foundation in programming, databases, and software development.', 2),
('SSC (10th Standard)', 'Sardar Patel Education Institute', 'GSEB', '2021', '2021', '77.7%', 'Completed secondary education with science and mathematics focus.', 3);

-- ---- Work Experience ----
INSERT INTO work_experience (job_title, company, location, start_date, end_date, description, display_order) VALUES
('Flutter App Developer Intern', 'Sparrow Software', 'Bhavnagar, Gujarat', '2023-07-27', '2023-09-10', 'Developed cross-platform mobile application features using Flutter and Dart. Integrated Firebase-based backend workflows for authentication, database operations, and data management. Applied debugging, testing, and version control practices in a professional software development environment.', 1),
('Java Development Intern', 'Baronal Talent Builders LLP', 'Bhavnagar, Gujarat', '2022-09-17', '2022-10-01', 'Completed Java development internship practicing OOP, problem solving, and debugging through coding exercises. Improved communication, presentation, and teamwork skills. Received an Excellent performance evaluation across behavioral and skill-based assessment areas.', 2);

-- ---- Social Links ----
INSERT INTO social_links (platform, url, icon, display_order) VALUES
('Email', 'https://mail.google.com/mail/?view=cm&fs=1&to=gohilbansirajsinh@gmail.com', 'fa-solid fa-envelope', 1),
('GitHub', 'https://github.com/bansirajsinh', 'fa-brands fa-github', 2),
('LinkedIn', 'https://linkedin.com/in/bansirajsinh-gohil', 'fa-brands fa-linkedin-in', 3);

-- ---- Navigation Items ----
INSERT INTO navigation_items (label, url, display_order) VALUES
('Home', '/', 1),
('Projects', '/projects', 2),
('Skills', '/skills', 3),
('About', '/about', 4),
('Contact', '/contact', 5);

-- ---- Site Settings ----
INSERT INTO site_settings (setting_key, setting_value) VALUES
('site_title', 'Bansirajsinh Gohil — Flutter & Full-Stack Developer'),
('site_description', 'Personal portfolio of Gohil Bansirajsinh — Flutter Developer, Full Stack Developer, Blockchain Enthusiast'),
('footer_text', '© 2026 Gohil Bansirajsinh. All rights reserved.'),
('contact_email', 'gohilbansirajsinh@gmail.com');
