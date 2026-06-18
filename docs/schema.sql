-- =========================================================
-- Portfolio Website MySQL Schema
-- Database: portfolio_db
-- Purpose: Store all content for a modern developer portfolio
-- =========================================================

DROP DATABASE IF EXISTS portfolio_db;
CREATE DATABASE portfolio_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE portfolio_db;

-- =========================================================
-- 1) SITE PROFILE
-- Stores the main identity and hero section content
-- =========================================================
CREATE TABLE site_profile (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    display_name VARCHAR(150) NOT NULL,
    headline VARCHAR(255) NOT NULL,
    subheadline VARCHAR(500) NULL,
    bio LONGTEXT NULL,
    location VARCHAR(150) NULL,
    email VARCHAR(150) NULL,
    phone VARCHAR(30) NULL,
    profile_image VARCHAR(255) NULL,
    hero_image VARCHAR(255) NULL,
    resume_url VARCHAR(255) NULL,
    availability_status VARCHAR(100) NULL DEFAULT 'Open for work',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- =========================================================
-- 2) SOCIAL LINKS
-- Stores all social media and external profile URLs
-- =========================================================
CREATE TABLE social_links (
    id INT AUTO_INCREMENT PRIMARY KEY,
    platform_name VARCHAR(100) NOT NULL,
    platform_slug VARCHAR(100) NOT NULL,
    url VARCHAR(500) NOT NULL,
    icon_class VARCHAR(100) NULL,
    sort_order INT NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uq_social_slug (platform_slug)
) ENGINE=InnoDB;

-- =========================================================
-- 3) NAVIGATION ITEMS
-- Useful if menus are managed from the database
-- =========================================================
CREATE TABLE navigation_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(100) NOT NULL,
    route VARCHAR(150) NOT NULL,
    sort_order INT NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- =========================================================
-- 4) SKILL CATEGORIES
-- Example: Frontend, Backend, Database, Tools, AI
-- =========================================================
CREATE TABLE skill_categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    category_slug VARCHAR(100) NOT NULL,
    description VARCHAR(255) NULL,
    icon_class VARCHAR(100) NULL,
    sort_order INT NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uq_skill_category_slug (category_slug)
) ENGINE=InnoDB;

-- =========================================================
-- 5) SKILLS
-- Stores each technical skill with a category relation
-- =========================================================
CREATE TABLE skills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    skill_name VARCHAR(120) NOT NULL,
    skill_slug VARCHAR(120) NOT NULL,
    proficiency_level TINYINT UNSIGNED NOT NULL DEFAULT 50, -- 0 to 100
    short_note VARCHAR(255) NULL,
    icon_class VARCHAR(100) NULL,
    color_tag VARCHAR(30) NULL,
    sort_order INT NOT NULL DEFAULT 0,
    is_featured BOOLEAN NOT NULL DEFAULT FALSE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uq_skill_slug (skill_slug),
    CONSTRAINT fk_skills_category
        FOREIGN KEY (category_id) REFERENCES skill_categories(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE INDEX idx_skills_category_id ON skills(category_id);

-- =========================================================
-- 6) EDUCATION
-- Stores academic details for timeline cards
-- =========================================================
CREATE TABLE education (
    id INT AUTO_INCREMENT PRIMARY KEY,
    institution_name VARCHAR(255) NOT NULL,
    degree_name VARCHAR(255) NOT NULL,
    specialization VARCHAR(255) NULL,
    university_board VARCHAR(255) NULL,
    start_year YEAR NULL,
    end_year YEAR NULL,
    grade VARCHAR(50) NULL,
    location VARCHAR(150) NULL,
    description LONGTEXT NULL,
    sort_order INT NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- =========================================================
-- 7) EXPERIENCE
-- Stores internships, jobs, freelance work, or training
-- =========================================================
CREATE TABLE experience (
    id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    role_title VARCHAR(255) NOT NULL,
    employment_type VARCHAR(100) NULL,
    start_date DATE NULL,
    end_date DATE NULL,
    is_current BOOLEAN NOT NULL DEFAULT FALSE,
    location VARCHAR(150) NULL,
    description LONGTEXT NULL,
    achievements LONGTEXT NULL,
    sort_order INT NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE INDEX idx_experience_company_name ON experience(company_name);

-- =========================================================
-- 8) CERTIFICATIONS
-- =========================================================
CREATE TABLE certifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    certificate_name VARCHAR(255) NOT NULL,
    issuer_name VARCHAR(255) NOT NULL,
    issue_date DATE NULL,
    expiry_date DATE NULL,
    credential_id VARCHAR(255) NULL,
    credential_url VARCHAR(500) NULL,
    description LONGTEXT NULL,
    sort_order INT NOT NULL DEFAULT 0,
    is_featured BOOLEAN NOT NULL DEFAULT FALSE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- =========================================================
-- 9) PROJECT CATEGORIES
-- Examples: Full Stack, Frontend, Mobile App, AI, UI/UX
-- =========================================================
CREATE TABLE project_categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    category_slug VARCHAR(100) NOT NULL,
    icon_class VARCHAR(100) NULL,
    description VARCHAR(255) NULL,
    sort_order INT NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uq_project_category_slug (category_slug)
) ENGINE=InnoDB;

-- =========================================================
-- 10) PROJECTS
-- Main project table for portfolio cards and details page
-- =========================================================
CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NULL,
    title VARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL,
    short_description VARCHAR(500) NOT NULL,
    full_description LONGTEXT NULL,
    problem_statement LONGTEXT NULL,
    solution_summary LONGTEXT NULL,
    my_role VARCHAR(255) NULL,
    status VARCHAR(100) NULL DEFAULT 'Completed',
    featured BOOLEAN NOT NULL DEFAULT FALSE,
    completion_date DATE NULL,
    thumbnail_url VARCHAR(500) NULL,
    cover_image_url VARCHAR(500) NULL,
    github_url VARCHAR(500) NULL,
    live_url VARCHAR(500) NULL,
    documentation_url VARCHAR(500) NULL,
    sort_order INT NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uq_project_slug (slug),
    CONSTRAINT fk_projects_category
        FOREIGN KEY (category_id) REFERENCES project_categories(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE INDEX idx_projects_category_id ON projects(category_id);
CREATE INDEX idx_projects_featured ON projects(featured);

-- =========================================================
-- 11) PROJECT TECHNOLOGIES
-- Many-to-many relation between projects and technologies
-- =========================================================
CREATE TABLE technologies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    technology_name VARCHAR(120) NOT NULL,
    technology_slug VARCHAR(120) NOT NULL,
    icon_class VARCHAR(100) NULL,
    sort_order INT NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uq_technology_slug (technology_slug)
) ENGINE=InnoDB;

CREATE TABLE project_technologies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    technology_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uq_project_tech (project_id, technology_id),
    CONSTRAINT fk_project_technologies_project
        FOREIGN KEY (project_id) REFERENCES projects(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_project_technologies_technology
        FOREIGN KEY (technology_id) REFERENCES technologies(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE INDEX idx_project_technologies_project_id ON project_technologies(project_id);
CREATE INDEX idx_project_technologies_technology_id ON project_technologies(technology_id);

-- =========================================================
-- 12) PROJECT IMAGES
-- Stores screenshots or gallery images for a project
-- =========================================================
CREATE TABLE project_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    image_url VARCHAR(500) NOT NULL,
    alt_text VARCHAR(255) NULL,
    caption VARCHAR(255) NULL,
    sort_order INT NOT NULL DEFAULT 0,
    is_cover BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_project_images_project
        FOREIGN KEY (project_id) REFERENCES projects(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE INDEX idx_project_images_project_id ON project_images(project_id);

-- =========================================================
-- 13) PROJECT LINKS
-- Stores extra links such as case study or demo video
-- =========================================================
CREATE TABLE project_links (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    link_label VARCHAR(100) NOT NULL,
    link_url VARCHAR(500) NOT NULL,
    link_type VARCHAR(50) NULL,
    sort_order INT NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_project_links_project
        FOREIGN KEY (project_id) REFERENCES projects(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE INDEX idx_project_links_project_id ON project_links(project_id);

-- =========================================================
-- 14) TESTIMONIALS
-- Optional social proof section
-- =========================================================
CREATE TABLE testimonials (
    id INT AUTO_INCREMENT PRIMARY KEY,
    person_name VARCHAR(255) NOT NULL,
    person_role VARCHAR(255) NULL,
    company_name VARCHAR(255) NULL,
    testimonial_text LONGTEXT NOT NULL,
    avatar_url VARCHAR(500) NULL,
    rating TINYINT UNSIGNED NULL,
    sort_order INT NOT NULL DEFAULT 0,
    is_featured BOOLEAN NOT NULL DEFAULT FALSE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- =========================================================
-- 15) CONTACT MESSAGES
-- Stores contact form submissions
-- =========================================================
CREATE TABLE contact_messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    message LONGTEXT NOT NULL,
    source_page VARCHAR(150) NULL,
    ip_address VARCHAR(100) NULL,
    user_agent VARCHAR(500) NULL,
    status ENUM('Unread', 'Read', 'Replied', 'Archived') NOT NULL DEFAULT 'Unread',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE INDEX idx_contact_messages_status ON contact_messages(status);
CREATE INDEX idx_contact_messages_created_at ON contact_messages(created_at);

-- =========================================================
-- 16) SITE SETTINGS
-- Stores editable site-wide settings and metadata
-- =========================================================
CREATE TABLE site_settings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    setting_key VARCHAR(150) NOT NULL,
    setting_value LONGTEXT NULL,
    setting_type VARCHAR(50) NULL DEFAULT 'text',
    is_public BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uq_setting_key (setting_key)
) ENGINE=InnoDB;

-- =========================================================
-- 17) BLOG POSTS
-- Optional content marketing section
-- =========================================================
CREATE TABLE blog_posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL,
    excerpt VARCHAR(500) NULL,
    content LONGTEXT NOT NULL,
    featured_image VARCHAR(500) NULL,
    meta_title VARCHAR(255) NULL,
    meta_description VARCHAR(500) NULL,
    is_published BOOLEAN NOT NULL DEFAULT TRUE,
    published_at DATETIME NULL,
    sort_order INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uq_blog_slug (slug)
) ENGINE=InnoDB;

-- =========================================================
-- 18) ADMIN USERS
-- For optional dashboard and content management
-- =========================================================
CREATE TABLE admin_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(150) NULL,
    role ENUM('superadmin', 'admin', 'editor') NOT NULL DEFAULT 'admin',
    last_login_at DATETIME NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uq_admin_username (username),
    UNIQUE KEY uq_admin_email (email)
) ENGINE=InnoDB;

-- =========================================================
-- 19) VISITORS
-- Optional analytics
-- =========================================================
CREATE TABLE visitors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ip_address VARCHAR(100) NULL,
    country VARCHAR(100) NULL,
    city VARCHAR(100) NULL,
    browser VARCHAR(150) NULL,
    device_type VARCHAR(100) NULL,
    visited_page VARCHAR(255) NULL,
    referrer_url VARCHAR(500) NULL,
    visited_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE INDEX idx_visitors_visited_at ON visitors(visited_at);

-- =========================================================
-- 20) PAGE VIEWS
-- Useful for simple page analytics
-- =========================================================
CREATE TABLE page_views (
    id INT AUTO_INCREMENT PRIMARY KEY,
    page_path VARCHAR(255) NOT NULL,
    view_count INT NOT NULL DEFAULT 1,
    last_viewed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uq_page_path (page_path)
) ENGINE=InnoDB;

-- =========================================================
-- SAMPLE SEED DATA
-- Replace placeholders with final details
-- =========================================================

INSERT INTO site_profile (
    full_name, display_name, headline, subheadline, bio, location, email,
    phone, profile_image, hero_image, resume_url, availability_status
) VALUES (
    '[YOUR FULL NAME]',
    '[YOUR DISPLAY NAME]',
    'Full-Stack Developer',
    'I build clean, responsive, and scalable digital experiences.',
    'A passionate developer who creates modern websites, web applications, and mobile-ready interfaces with a strong focus on UI quality, maintainability, and user experience.',
    '[YOUR LOCATION]',
    '[YOUR EMAIL]',
    '[YOUR PHONE]',
    'assets/images/profile.jpg',
    'assets/images/hero.png',
    '[YOUR RESUME URL]',
    'Open for freelance and internship opportunities'
);

INSERT INTO skill_categories (category_name, category_slug, description, icon_class, sort_order) VALUES
('Frontend', 'frontend', 'UI and client-side development skills', 'fa-solid fa-laptop-code', 1),
('Backend', 'backend', 'Server-side and API development', 'fa-solid fa-server', 2),
('Database', 'database', 'Data storage and relational systems', 'fa-solid fa-database', 3),
('Tools', 'tools', 'Version control, deployment, and utilities', 'fa-solid fa-screwdriver-wrench', 4),
('AI', 'ai', 'Automation and artificial intelligence tools', 'fa-solid fa-wand-magic-sparkles', 5);

INSERT INTO technologies (technology_name, technology_slug, sort_order) VALUES
('HTML', 'html', 1),
('CSS', 'css', 2),
('JavaScript', 'javascript', 3),
('Node.js', 'nodejs', 4),
('Express.js', 'expressjs', 5),
('MySQL', 'mysql', 6),
('React', 'react', 7),
('Tailwind', 'tailwind', 8),
('GitHub', 'github', 9);

-- =========================================================
-- NOTES FOR IMPLEMENTATION
-- =========================================================
-- 1. Keep all text fields flexible using LONGTEXT where needed.
-- 2. Use slug fields for SEO-friendly routes.
-- 3. Keep project screenshots in a separate table.
-- 4. Use site_settings for things like theme color, footer text, analytics IDs, and SEO metadata.
-- 5. Use prepared statements in backend code for all SQL operations.
-- 6. Add auth middleware before allowing access to admin tables.
-- 7. If the site is static-only, the database can still be used for the contact form and admin updates later.
-- 8. Replace all placeholder values before production deployment.
