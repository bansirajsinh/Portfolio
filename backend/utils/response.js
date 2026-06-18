// ============================================
// Standardized JSON Response Helpers
// ============================================

/**
 * Success response
 */
function success(res, data, message = 'Success', statusCode = 200) {
  return res.status(statusCode).json({
    success: true,
    message,
    data,
  });
}

/**
 * Error response
 */
function error(res, message = 'Something went wrong', statusCode = 500, errors = null) {
  const response = {
    success: false,
    message,
  };
  if (errors) response.errors = errors;
  return res.status(statusCode).json(response);
}

/**
 * Validation error response
 */
function validationError(res, errors) {
  return res.status(422).json({
    success: false,
    message: 'Validation failed',
    errors,
  });
}

/**
 * Not found response
 */
function notFound(res, resource = 'Resource') {
  return res.status(404).json({
    success: false,
    message: `${resource} not found`,
  });
}

module.exports = { success, error, validationError, notFound };
