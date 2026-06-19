-- ============================================
-- DATABASE SCHEMA — Portfolio of Gohil Bansirajsinh
-- ============================================

-- CREATE DATABASE IF NOT EXISTS portfolio_db;
-- USE portfolio_db;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS project_technologies;
DROP TABLE IF EXISTS project_images;
DROP TABLE IF EXISTS project_links;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS project_categories;
DROP TABLE IF EXISTS technologies;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS skill_categories;
DROP TABLE IF EXISTS site_profile;
DROP TABLE IF EXISTS education;
DROP TABLE IF EXISTS work_experience;
DROP TABLE IF EXISTS contact_messages;
DROP TABLE IF EXISTS social_links;
DROP TABLE IF EXISTS navigation_items;
DROP TABLE IF EXISTS site_settings;
DROP TABLE IF EXISTS certifications;
SET FOREIGN_KEY_CHECKS = 1;

-- ---- Site Profile ----
CREATE TABLE site_profile (
  id INT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(255) NOT NULL,
  headline VARCHAR(500),
  short_bio TEXT,
  long_bio TEXT,
  email VARCHAR(255),
  github_url VARCHAR(500),
  linkedin_url VARCHAR(500),
  location VARCHAR(255),
  resume_url VARCHAR(500),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ---- Skill Categories ----
CREATE TABLE skill_categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(100) NOT NULL,
  icon VARCHAR(100),
  display_order INT DEFAULT 0
);

-- ---- Technologies ----
CREATE TABLE technologies (
  id INT AUTO_INCREMENT PRIMARY KEY,
  technology_name VARCHAR(100) NOT NULL,
  technology_slug VARCHAR(100),
  category_id INT,
  proficiency INT DEFAULT 50,
  sort_order INT DEFAULT 0,
  display_order INT DEFAULT 0,
  FOREIGN KEY (category_id) REFERENCES skill_categories(id) ON DELETE CASCADE
);

-- ---- Project Categories ----
CREATE TABLE project_categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(100) NOT NULL,
  category_slug VARCHAR(100) NOT NULL UNIQUE,
  sort_order INT DEFAULT 0
);

-- ---- Projects ----
CREATE TABLE projects (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  slug VARCHAR(255) UNIQUE NOT NULL,
  short_description TEXT,
  long_description TEXT,
  full_description TEXT,
  problem_statement TEXT,
  solution_summary TEXT,
  category_id INT,
  my_role VARCHAR(255),
  status VARCHAR(100),
  is_active TINYINT(1) DEFAULT 1,
  featured TINYINT(1) DEFAULT 0,
  github_url VARCHAR(500),
  live_url VARCHAR(500),
  sort_order INT DEFAULT 0,
  display_order INT DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (category_id) REFERENCES project_categories(id) ON DELETE SET NULL
);

-- ---- Project Images ----
CREATE TABLE project_images (
  id INT AUTO_INCREMENT PRIMARY KEY,
  project_id INT NOT NULL,
  image_url VARCHAR(500) NOT NULL,
  alt_text VARCHAR(255),
  caption VARCHAR(255),
  sort_order INT DEFAULT 0,
  FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
);

-- ---- Project Links ----
CREATE TABLE project_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  project_id INT NOT NULL,
  link_url VARCHAR(500) NOT NULL,
  link_label VARCHAR(100) NOT NULL,
  is_active TINYINT(1) DEFAULT 1,
  sort_order INT DEFAULT 0,
  FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
);

-- ---- Project Technologies (many-to-many) ----
CREATE TABLE project_technologies (
  id INT AUTO_INCREMENT PRIMARY KEY,
  project_id INT NOT NULL,
  technology_id INT NOT NULL,
  FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
  FOREIGN KEY (technology_id) REFERENCES technologies(id) ON DELETE CASCADE
);

-- ---- Education ----
CREATE TABLE education (
  id INT AUTO_INCREMENT PRIMARY KEY,
  degree VARCHAR(255) NOT NULL,
  institution VARCHAR(255) NOT NULL,
  university VARCHAR(255),
  start_year VARCHAR(10),
  end_year VARCHAR(10),
  grade VARCHAR(50),
  description TEXT,
  display_order INT DEFAULT 0
);

-- ---- Work Experience ----
CREATE TABLE work_experience (
  id INT AUTO_INCREMENT PRIMARY KEY,
  job_title VARCHAR(255) NOT NULL,
  company VARCHAR(255) NOT NULL,
  location VARCHAR(255),
  start_date DATE,
  end_date DATE,
  description TEXT,
  display_order INT DEFAULT 0
);

-- ---- Contact Messages ----
CREATE TABLE contact_messages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  subject VARCHAR(500),
  message TEXT NOT NULL,
  is_read TINYINT(1) DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ---- Social Links ----
CREATE TABLE social_links (
  id INT AUTO_INCREMENT PRIMARY KEY,
  platform VARCHAR(100) NOT NULL,
  url VARCHAR(500) NOT NULL,
  icon VARCHAR(100),
  display_order INT DEFAULT 0
);

-- ---- Navigation Items ----
CREATE TABLE navigation_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  label VARCHAR(100) NOT NULL,
  url VARCHAR(500) NOT NULL,
  display_order INT DEFAULT 0
);

-- ---- Site Settings ----
CREATE TABLE site_settings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  setting_key VARCHAR(100) UNIQUE NOT NULL,
  setting_value TEXT
);

-- ---- Certifications ----
CREATE TABLE certifications (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  issuer VARCHAR(255),
  issue_date DATE,
  description TEXT,
  display_order INT DEFAULT 0
);
