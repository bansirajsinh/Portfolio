// ============================================
// Express App Setup
// ============================================
const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const path = require('path');
const { errorHandler } = require('./middleware/errorHandler');

const app = express();

// ---- Security ----
app.use(helmet({
  contentSecurityPolicy: false,
  crossOriginEmbedderPolicy: false,
}));

// ---- CORS ----
const allowedOrigins = (process.env.ALLOWED_ORIGINS || '')
  .split(',')
  .map(s => s.trim())
  .filter(Boolean);

app.use(cors({
  origin: allowedOrigins.length > 0 ? allowedOrigins : '*',
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  credentials: true,
}));

// ---- Body parsing ----
app.use(express.json({ limit: '5mb' }));
app.use(express.urlencoded({ extended: true }));

// ---- Serve static frontend files ----
app.use(express.static(path.join(__dirname, '..')));
app.use('/html', express.static(path.join(__dirname, '..', 'html')));
app.use('/css', express.static(path.join(__dirname, '..', 'css')));
app.use('/js', express.static(path.join(__dirname, '..', 'js')));
app.use('/assets', express.static(path.join(__dirname, '..', 'assets')));

// ---- API Routes ----
const profileRoutes = require('./api/profileRoutes');
const skillRoutes = require('./api/skillRoutes');
const projectRoutes = require('./api/projectRoutes');
const educationRoutes = require('./api/educationRoutes');
const experienceRoutes = require('./api/experienceRoutes');
const contactRoutes = require('./api/contactRoutes');
const socialRoutes = require('./api/socialRoutes');
const navigationRoutes = require('./api/navigationRoutes');
const settingsRoutes = require('./api/settingsRoutes');
const certificationRoutes = require('./api/certificationRoutes');

app.use('/api/profile', profileRoutes);
app.use('/api/skills', skillRoutes);
app.use('/api/projects', projectRoutes);
app.use('/api/education', educationRoutes);
app.use('/api/experience', experienceRoutes);
app.use('/api/contact', contactRoutes);
app.use('/api/social-links', socialRoutes);
app.use('/api/navigation', navigationRoutes);
app.use('/api/site-settings', settingsRoutes);
app.use('/api/certifications', certificationRoutes);

// ---- Serve HTML pages ----
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, '..', 'html', 'index.html'));
});

app.get('/about', (req, res) => {
  res.sendFile(path.join(__dirname, '..', 'html', 'about.html'));
});

app.get('/skills', (req, res) => {
  res.sendFile(path.join(__dirname, '..', 'html', 'skills.html'));
});

app.get('/projects', (req, res) => {
  res.sendFile(path.join(__dirname, '..', 'html', 'projects.html'));
});

app.get('/projects/:slug', (req, res) => {
  res.sendFile(path.join(__dirname, '..', 'html', 'project-details.html'));
});

app.get('/contact', (req, res) => {
  res.sendFile(path.join(__dirname, '..', 'html', 'contact.html'));
});

// ---- Health check ----
app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', timestamp: new Date().toISOString() });
});

// ---- 404 handler ----
app.use((req, res) => {
  res.status(404).json({ success: false, message: 'Endpoint not found' });
});

// ---- Global error handler ----
app.use(errorHandler);

module.exports = app;
