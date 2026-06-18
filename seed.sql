-- =========================================================
-- Portfolio Website — Seed Data
-- Run AFTER schema.sql
-- For: Gohil Bansirajsinh Pradipsinh
-- =========================================================
USE portfolio_db;

-- =========================================================
-- SITE PROFILE
-- =========================================================
DELETE FROM site_profile;
INSERT INTO site_profile (
  full_name, display_name, headline, subheadline, bio, location, email,
  phone, profile_image, hero_image, resume_url, availability_status
) VALUES (
  'Gohil Bansirajsinh Pradipsinh',
  'Bansirajsinh Gohil',
  'Flutter Developer | Full Stack Developer | Firebase, MySQL & Blockchain Enthusiast',
  'I build clean, responsive, and scalable digital experiences.',
  'Information Technology student with hands-on experience in Flutter application development, full-stack web development, Firebase, MySQL, and blockchain technologies. Completed internships in Flutter and Java development and built multiple real-world projects including inventory management, civic issue reporting, blockchain-based e-voting, social media, e-commerce, and a family business website. Strong in problem solving, teamwork, debugging, responsive UI development, and building user-focused software solutions.',
  'Bhavnagar, Gujarat, India',
  'gohilbansirajsinh@gmail.com',
  '7041537733',
  'assets/images/profile.jpg',
  'assets/images/hero.png',
  NULL,
  'Open for freelance and internship opportunities'
);

-- =========================================================
-- SOCIAL LINKS
-- =========================================================
DELETE FROM social_links;
INSERT INTO social_links (platform_name, platform_slug, url, icon_class, sort_order) VALUES
('Email',     'email',     'https://mail.google.com/mail/?view=cm&fs=1&to=gohilbansirajsinh@gmail.com',          'fa-solid fa-envelope',      1),
('GitHub',    'github',    'https://github.com/bansirajsinh',             'fa-brands fa-github',        2),
('LinkedIn',  'linkedin',  'https://linkedin.com/in/bansirajsinh-gohil',  'fa-brands fa-linkedin-in',   3);

-- =========================================================
-- NAVIGATION ITEMS
-- =========================================================
DELETE FROM navigation_items;
INSERT INTO navigation_items (label, route, sort_order) VALUES
('Home',     '/',         1),
('Projects', '/projects', 2),
('Skills',   '/skills',   3),
('About',    '/about',    4),
('Contact',  '/contact',  5);

-- =========================================================
-- SKILL CATEGORIES + SKILLS (from resume)
-- =========================================================
DELETE FROM skills;
DELETE FROM skill_categories;

INSERT INTO skill_categories (id, category_name, category_slug, description, icon_class, sort_order) VALUES
(1, 'Mobile Development',   'mobile',    'Cross-platform mobile apps with Flutter & Dart',     'fa-solid fa-mobile-screen',       1),
(2, 'Frontend',              'frontend',  'UI and client-side web development',                 'fa-solid fa-laptop-code',         2),
(3, 'Backend',               'backend',   'Server-side and API development',                    'fa-solid fa-server',              3),
(4, 'Database',              'database',  'Data storage, Firebase & relational systems',        'fa-solid fa-database',            4),
(5, 'Blockchain',            'blockchain','Blockchain and smart contract development',          'fa-solid fa-link',                5),
(6, 'DevOps & Tools',        'tools',     'Version control, IDEs, and utilities',               'fa-solid fa-screwdriver-wrench',  6),
(7, 'Core Competencies',     'core',      'Essential software development skills',              'fa-solid fa-brain',               7);

INSERT INTO skills (category_id, skill_name, skill_slug, proficiency_level, sort_order) VALUES
-- Mobile Development
(1, 'Flutter',                  'flutter',                  85, 1),
(1, 'Dart',                     'dart',                     80, 2),
(1, 'Firebase Authentication',  'firebase-auth',            80, 3),
(1, 'Firebase Storage',         'firebase-storage',         75, 4),
(1, 'Cloud Firestore',          'cloud-firestore',          75, 5),
-- Frontend
(2, 'HTML5',            'html5',            90, 1),
(2, 'CSS3',             'css3',             85, 2),
(2, 'JavaScript',       'javascript',       85, 3),
(2, 'Responsive Design','responsive-design',80, 4),
-- Backend
(3, 'Node.js',          'nodejs',           80, 1),
(3, 'Express.js',       'expressjs',        80, 2),
(3, 'REST APIs',        'rest-apis',        85, 3),
(3, 'Authentication',   'auth',             75, 4),
(3, 'Authorization',    'authorization',    75, 5),
(3, 'AdonisJS v6',      'adonisjs',         65, 6),
-- Database
(4, 'MySQL',                     'mysql',               75, 1),
(4, 'Firebase Realtime Database','firebase-rtdb',       70, 2),
(4, 'Firestore',                 'firestore',           70, 3),
-- Blockchain
(5, 'Ethereum',         'ethereum',         55, 1),
(5, 'Solidity',         'solidity',         50, 2),
(5, 'Ganache',          'ganache',          50, 3),
-- Tools
(6, 'Git',              'git',              85, 1),
(6, 'GitHub',           'github-tool',      85, 2),
(6, 'Android Studio',   'android-studio',   70, 3),
(6, 'VS Code',          'vscode',           90, 4),
-- Core Competencies
(7, 'CRUD Operations',      'crud',             85, 1),
(7, 'SDLC',                 'sdlc',             70, 2),
(7, 'Debugging',            'debugging',        80, 3),
(7, 'Problem Solving',      'problem-solving',  85, 4),
(7, 'Team Collaboration',   'team-collab',      80, 5),
(7, 'Adaptability',         'adaptability',     85, 6);

-- =========================================================
-- EDUCATION
-- =========================================================
DELETE FROM education;
INSERT INTO education (institution_name, degree_name, specialization, university_board, start_year, end_year, grade, location, description, sort_order) VALUES
('Shantilal Shah Engineering College, Bhavnagar', 'B.E. in Information Technology', 'Information Technology', 'Gujarat Technological University', 2024, NULL, 'Pursuing', 'Bhavnagar, Gujarat', 'Currently pursuing Bachelor of Engineering in IT with focus on web technologies, mobile development, and software engineering.', 1),
('Gyan Manjari Diploma Engineering College', 'Diploma in Information Technology', 'Information Technology', 'Gujarat Technological University', 2021, 2024, '87.2%', 'Gujarat', 'Completed diploma with strong foundation in programming, databases, and software development.', 2),
('Sardar Patel Education Institute', 'SSC (10th Standard)', NULL, 'GSEB', NULL, 2021, '77.7%', 'Gujarat', 'Completed secondary education.', 3);

-- =========================================================
-- EXPERIENCE (Internships)
-- =========================================================
DELETE FROM experience;
INSERT INTO experience (company_name, role_title, employment_type, start_date, end_date, is_current, location, description, achievements, sort_order) VALUES
('Sparrow Software', 'Flutter App Developer Intern', 'Internship', '2023-07-27', '2023-09-30', 0, 'Bhavnagar, Gujarat',
 'Developed cross-platform mobile application features using Flutter and Dart for real-world application modules and user interfaces. Integrated Firebase-based backend workflows for authentication, database operations, and data management. Applied debugging, testing, and version control practices while working in a professional software development environment.',
 NULL, 1),
('Baronal Talent Builders LLP', 'Java Development Intern', 'Internship', '2022-09-17', '2022-10-01', 0, 'Bhavnagar, Gujarat',
 'Completed a 2-week Java development internship as part of academic training requirements. Practiced object-oriented programming (OOP), problem solving, and debugging through coding exercises and assigned tasks. Improved communication, presentation, concentration, and teamwork skills during internship activities.',
 'Received an Excellent performance evaluation across behavioral and skill-based assessment areas.', 2);

-- =========================================================
-- PROJECT CATEGORIES
-- =========================================================
DELETE FROM project_categories;
INSERT INTO project_categories (id, category_name, category_slug, sort_order) VALUES
(1, 'Full Stack',  'full-stack', 1),
(2, 'Mobile',      'mobile',     2),
(3, 'Frontend',    'frontend',   3),
(4, 'Backend',     'backend',    4),
(5, 'Blockchain',  'blockchain', 5);

-- =========================================================
-- TECHNOLOGIES
-- =========================================================
DELETE FROM technologies;
INSERT INTO technologies (id, technology_name, technology_slug, sort_order) VALUES
(1,  'Flutter',         'flutter',         1),
(2,  'Firebase',        'firebase',        2),
(3,  'Ethereum',        'ethereum',        3),
(4,  'Solidity',        'solidity',        4),
(5,  'Web3.dart',       'web3dart',        5),
(6,  'Dart',            'dart',            6),
(7,  'Google Maps/GPS', 'google-maps',     7),
(8,  'HTML',            'html',            8),
(9,  'CSS',             'css',             9),
(10, 'JavaScript',      'javascript',      10),
(11, 'Node.js',         'nodejs',          11),
(12, 'Express.js',      'expressjs',       12),
(13, 'MySQL',           'mysql',           13),
(14, 'AdonisJS v6',     'adonisjs',        14);

-- =========================================================
-- PROJECTS (from resume)
-- =========================================================
DELETE FROM projects;
INSERT INTO projects (id, category_id, title, slug, short_description, full_description, problem_statement, solution_summary, my_role, status, featured, sort_order) VALUES
(1, 5, 'E-Voting System Using Blockchain',
 'e-voting-blockchain',
 'A secure digital voting system using blockchain technology with vote immutability, Ethereum smart contracts, and tamper-resistant vote recording.',
 'Developed a secure digital voting workflow with blockchain-based vote immutability and authentication. Integrated Firebase with Ethereum smart contracts for voter verification, election history, and tamper-resistant vote recording.',
 'Traditional voting systems are vulnerable to tampering, fraud, and lack transparency in the vote counting process.',
 'Built a blockchain-based e-voting system using Flutter and Ethereum smart contracts that ensures vote immutability, transparency, and tamper-resistant recording.',
 'Full-Stack Developer',
 'Completed', 1, 1),

(2, 2, 'Inventory Management System',
 'inventory-management',
 'A mobile app to manage stock, quantities, product records, search, favorites, and CRUD operations with Firebase backend.',
 'Built a mobile app to manage stock, quantities, product records, search, favorites, and CRUD operations. Implemented Firebase-backed data storage and user-friendly inventory workflows for small business use.',
 'Small businesses need a simple, mobile-friendly way to track inventory, manage stock levels, and perform CRUD operations on the go.',
 'Built a Flutter-based inventory management app with Firebase for real-time data sync, search, favorites, and complete CRUD functionality.',
 'Mobile Developer',
 'Completed', 1, 2),

(3, 2, 'StreetFixer App',
 'streetfixer-app',
 'A civic issue reporting app for potholes and road damage with image upload and location tracking using Flutter, Firebase, and Google Maps.',
 'Developed a civic issue reporting app for potholes and road damage with image upload and location tracking. Designed a complaint submission flow to support faster issue reporting and tracking.',
 'Citizens lack an easy way to report road damage and civic issues with precise location data for municipal authorities.',
 'Built a Flutter app with Google Maps integration for geotagged civic issue reporting with image upload and Firebase backend.',
 'Mobile Developer',
 'Completed', 1, 3),

(4, 1, 'Social Media Platform',
 'social-media-platform',
 'A full-stack social platform with authentication, profiles, posts, likes, comments, and search built with HTML, CSS, JavaScript, Node.js, Express.js, and MySQL.',
 'Built a full-stack social platform with authentication, profiles, posts, likes, comments, and search. Used MySQL for structured data storage and Node.js/Express.js for backend logic and APIs.',
 'Users need a platform for social interaction with features like posting, liking, commenting, and searching other users.',
 'Built a complete social media platform with Node.js backend, MySQL database, and responsive frontend with authentication and social features.',
 'Full-Stack Developer',
 'Completed', 1, 4),

(5, 1, 'E-Commerce Store',
 'e-commerce-store',
 'An online storefront with product listings, cart flow, order handling, and database integration built with HTML, CSS, JavaScript, Node.js, Express.js, and MySQL.',
 'Developed an online storefront with product listings, cart flow, order handling, and database integration. Implemented user and admin-style management features for a complete shopping experience.',
 'Small businesses need affordable, functional e-commerce platforms to sell products online with order management.',
 'Built a full-stack e-commerce store with product management, shopping cart, order processing, and MySQL-backed data persistence.',
 'Full-Stack Developer',
 'Completed', 1, 5),

(6, 1, 'Chitrakar Gohil Website',
 'chitrakar-gohil',
 'A professional family business website to showcase the art legacy, services, and contact details with AdonisJS v6 backend and MySQL storage.',
 'Created a professional family business website to showcase the art legacy, services, and contact details. Designed a clean responsive interface with backend support for content management and MySQL storage.',
 'The family art business needed a professional online presence to showcase their legacy, services, and facilitate contact.',
 'Built a professional business website with AdonisJS v6 backend, MySQL database, and clean responsive frontend design.',
 'Full-Stack Developer',
 'Completed', 0, 6);

-- =========================================================
-- PROJECT TECHNOLOGIES (many-to-many)
-- =========================================================
DELETE FROM project_technologies;
-- E-Voting: Flutter, Firebase, Ethereum, Solidity, Web3.dart
INSERT INTO project_technologies (project_id, technology_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5);

-- Inventory: Flutter, Dart, Firebase
INSERT INTO project_technologies (project_id, technology_id) VALUES
(2, 1), (2, 6), (2, 2);

-- StreetFixer: Flutter, Firebase, Google Maps/GPS
INSERT INTO project_technologies (project_id, technology_id) VALUES
(3, 1), (3, 2), (3, 7);

-- Social Media: HTML, CSS, JavaScript, Node.js, Express.js, MySQL
INSERT INTO project_technologies (project_id, technology_id) VALUES
(4, 8), (4, 9), (4, 10), (4, 11), (4, 12), (4, 13);

-- E-Commerce: HTML, CSS, JavaScript, Node.js, Express.js, MySQL
INSERT INTO project_technologies (project_id, technology_id) VALUES
(5, 8), (5, 9), (5, 10), (5, 11), (5, 12), (5, 13);

-- Chitrakar Gohil: HTML, CSS, JavaScript, AdonisJS v6, MySQL
INSERT INTO project_technologies (project_id, technology_id) VALUES
(6, 8), (6, 9), (6, 10), (6, 14), (6, 13);

-- =========================================================
-- SITE SETTINGS
-- =========================================================
DELETE FROM site_settings;
INSERT INTO site_settings (setting_key, setting_value, setting_type) VALUES
('site_title',       'Bansirajsinh Gohil — Flutter & Full-Stack Developer', 'text'),
('meta_description', 'Portfolio of Gohil Bansirajsinh Pradipsinh — Flutter Developer, Full Stack Developer, Firebase, MySQL & Blockchain Enthusiast from Bhavnagar, Gujarat.', 'text'),
('theme',            'dark',                                       'text'),
('accent_color',     '#22c55e',                                    'color'),
('footer_text',      '© 2026 Gohil Bansirajsinh Pradipsinh. All rights reserved.', 'text');
