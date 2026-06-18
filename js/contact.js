// ============================================
// Contact Form — Validation + Submission + Email
// ============================================
document.addEventListener('DOMContentLoaded', () => {
  initContactForm();
});

function initContactForm() {
  const form = document.getElementById('contactForm');
  if (!form) return;

  form.addEventListener('submit', async (e) => {
    e.preventDefault();

    // Clear previous errors
    clearErrors(form);

    // Collect form data
    const data = {
      full_name: form.full_name.value.trim(),
      email: form.email.value.trim(),
      subject: form.subject.value.trim(),
      message: form.message.value.trim(),
    };

    // Client-side validation
    let hasError = false;

    if (!data.full_name || data.full_name.length < 2) {
      showFieldError(form.full_name, 'Please enter your name (at least 2 characters)');
      hasError = true;
    }

    if (!data.email || !isValidEmail(data.email)) {
      showFieldError(form.email, 'Please enter a valid email address');
      hasError = true;
    }

    if (!data.subject || data.subject.length < 2) {
      showFieldError(form.subject, 'Please enter a subject');
      hasError = true;
    }

    if (!data.message || data.message.length < 10) {
      showFieldError(form.message, 'Message must be at least 10 characters');
      hasError = true;
    }

    if (hasError) return;

    // Show loading state
    const submitBtn = form.querySelector('button[type="submit"]');
    const originalText = submitBtn.innerHTML;
    submitBtn.classList.add('btn-loading');
    submitBtn.disabled = true;
    submitBtn.innerHTML = 'Sending...';

    try {
      const res = await API.post('/contact', data);
      showToast(res.message || 'Message sent successfully!', 'success');
      form.reset();
    } catch (err) {
      // Handle validation errors from server
      if (err.errors && Array.isArray(err.errors)) {
        err.errors.forEach(e => {
          const field = form.querySelector(`[name="${e.field}"]`);
          if (field) showFieldError(field, e.message);
        });
      } else {
        showToast(err.message || 'Failed to send message. Please try again.', 'error');
      }
    } finally {
      submitBtn.classList.remove('btn-loading');
      submitBtn.disabled = false;
      submitBtn.innerHTML = originalText;
    }
  });

  const directEmailBtn = document.getElementById('directEmailBtn');
  if (directEmailBtn) {
    directEmailBtn.addEventListener('click', () => {
      clearErrors(form);

      const data = {
        full_name: form.full_name.value.trim(),
        email: form.email.value.trim(),
        subject: form.subject.value.trim(),
        message: form.message.value.trim(),
      };

      let hasError = false;

      if (!data.message || data.message.length < 10) {
        showFieldError(form.message, 'Message must be at least 10 characters to send email');
        hasError = true;
      }

      if (hasError) return;

      const recipient = 'gohilbansirajsinh@gmail.com';
      const emailSubject = encodeURIComponent(data.subject ? `Portfolio Contact: ${data.subject}` : 'Portfolio Contact Inquiry');
      
      let bodyText = `Hello Bansirajsinh,\n\n${data.message}\n\n`;
      if (data.full_name) {
        bodyText += `Best regards,\n${data.full_name}\n`;
      }
      if (data.email) {
        bodyText += `Email: ${data.email}\n`;
      }
      const emailBody = encodeURIComponent(bodyText);

      const gmailUrl = `https://mail.google.com/mail/?view=cm&fs=1&to=${recipient}&su=${emailSubject}&body=${emailBody}`;
      window.open(gmailUrl, '_blank');
      showToast('Opening Gmail in a new tab... ✉️', 'success');
    });
  }
}

// ---- Helpers ----
function isValidEmail(email) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

function showFieldError(field, message) {
  field.classList.add('error');
  const errorEl = field.nextElementSibling;
  if (errorEl && errorEl.classList.contains('form-error')) {
    errorEl.textContent = message;
    errorEl.style.display = 'block';
  }
}

function clearErrors(form) {
  form.querySelectorAll('.error').forEach(el => el.classList.remove('error'));
  form.querySelectorAll('.form-error').forEach(el => {
    el.textContent = '';
    el.style.display = 'none';
  });
}
