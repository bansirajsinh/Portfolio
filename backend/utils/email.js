// ============================================
// Email Utility — Nodemailer (Gmail SMTP)
// ============================================
const nodemailer = require('nodemailer');

/**
 * Create reusable transporter using Gmail SMTP
 * Requires: SMTP_USER and SMTP_PASS (App Password) in .env
 */
function createTransporter() {
  return nodemailer.createTransport({
    host: process.env.SMTP_HOST || 'smtp.gmail.com',
    port: parseInt(process.env.SMTP_PORT) || 587,
    secure: false, // TLS
    auth: {
      user: process.env.SMTP_USER,
      pass: process.env.SMTP_PASS,
    },
  });
}

/**
 * Send contact form email to site owner
 * @param {Object} data - { full_name, email, subject, message }
 */
async function sendContactEmail(data) {
  const { full_name, email, subject, message } = data;
  const receiverEmail = process.env.CONTACT_RECEIVER_EMAIL || process.env.SMTP_USER;

  // Check if SMTP credentials are configured
  if (!process.env.SMTP_USER || !process.env.SMTP_PASS) {
    console.log('⚠️  Email not sent — SMTP credentials not configured in .env');
    return { sent: false, reason: 'SMTP not configured' };
  }

  const transporter = createTransporter();

  const mailOptions = {
    from: `"Portfolio Contact Form" <${process.env.SMTP_USER}>`,
    to: receiverEmail,
    replyTo: email,
    subject: `📬 Portfolio Contact: ${subject}`,
    html: `
      <div style="font-family: 'Segoe UI', Arial, sans-serif; max-width: 600px; margin: 0 auto; background: #0f0f0f; color: #f0f0f0; padding: 32px; border-radius: 12px;">
        <h2 style="color: #22c55e; margin-bottom: 24px;">New Contact Message</h2>
        <table style="width: 100%; border-collapse: collapse;">
          <tr>
            <td style="padding: 10px 0; color: #888; width: 100px;">Name:</td>
            <td style="padding: 10px 0; color: #f0f0f0; font-weight: 600;">${full_name}</td>
          </tr>
          <tr>
            <td style="padding: 10px 0; color: #888;">Email:</td>
            <td style="padding: 10px 0;"><a href="mailto:${email}" style="color: #22c55e;">${email}</a></td>
          </tr>
          <tr>
            <td style="padding: 10px 0; color: #888;">Subject:</td>
            <td style="padding: 10px 0; color: #f0f0f0;">${subject}</td>
          </tr>
        </table>
        <div style="margin-top: 24px; padding: 20px; background: #141414; border-radius: 8px; border: 1px solid #1e1e1e;">
          <p style="color: #888; font-size: 13px; margin-bottom: 8px;">Message:</p>
          <p style="color: #f0f0f0; line-height: 1.7; white-space: pre-wrap;">${message}</p>
        </div>
        <p style="margin-top: 24px; color: #555; font-size: 12px;">Sent from your portfolio website contact form.</p>
      </div>
    `,
    text: `New Contact Message\n\nName: ${full_name}\nEmail: ${email}\nSubject: ${subject}\n\nMessage:\n${message}\n\n---\nSent from portfolio website.`,
  };

  try {
    const info = await transporter.sendMail(mailOptions);
    console.log('✅ Contact email sent:', info.messageId);
    return { sent: true, messageId: info.messageId };
  } catch (err) {
    console.error('❌ Email send failed:', err.message);
    return { sent: false, reason: err.message };
  }
}

module.exports = { sendContactEmail };
