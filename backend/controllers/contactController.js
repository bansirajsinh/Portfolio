// ============================================
// Contact Controller — Saves to DB + Sends Email
// ============================================
const { insert } = require('../models/db');
const { success, error } = require('../utils/response');
const { sendContactEmail } = require('../utils/email');

/**
 * Handle contact form submission:
 * 1. Store in MySQL database
 * 2. Send email notification to site owner via Nodemailer
 */
async function submitContact(req, res, next) {
  try {
    const { full_name, email, subject, message } = req.body;

    // 1. Save to database
    const id = await insert(
      `INSERT INTO contact_messages (full_name, email, subject, message, source_page, ip_address, user_agent)
       VALUES (?, ?, ?, ?, ?, ?, ?)`,
      [
        full_name,
        email,
        subject,
        message,
        req.headers.referer || 'contact',
        req.ip,
        req.headers['user-agent'] || '',
      ]
    );

    // 2. Send email notification
    const emailResult = await sendContactEmail({ full_name, email, subject, message });

    return success(res, {
      id,
      emailSent: emailResult.sent,
    }, 'Message received! I\'ll get back to you soon.', 201);
  } catch (err) {
    next(err);
  }
}

module.exports = { submitContact };
