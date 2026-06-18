const mysql = require('mysql2/promise');
const fs = require('fs');
const path = require('path');
require('dotenv').config();

(async () => {
  try {
    const conn = await mysql.createConnection({
      host: process.env.DB_HOST || 'localhost',
      port: parseInt(process.env.DB_PORT) || 3306,
      user: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      database: process.env.DB_NAME || 'portfolio_db',
      multipleStatements: true
    });
    console.log('Successfully connected to DB for seeding.');

    const seedSqlPath = path.join(__dirname, '../seed.sql');
    const sql = fs.readFileSync(seedSqlPath, 'utf8');
    
    console.log('Running seed.sql...');
    await conn.query(sql);
    console.log('✅ Database seeded successfully!');
    
    await conn.end();
  } catch (err) {
    console.error('❌ Error seeding DB:', err);
  }
})();
