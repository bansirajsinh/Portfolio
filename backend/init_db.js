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
      multipleStatements: true
    });
    console.log('Successfully connected to DB.');

    const schemaSqlPath = path.join(__dirname, '../schema.sql');
    const schemaSql = fs.readFileSync(schemaSqlPath, 'utf8');
    
    console.log('Running schema.sql...');
    await conn.query(schemaSql);
    console.log('✅ Schema executed successfully!');

    // Select the DB manually in case schema.sql didn't persist the connection context
    await conn.query('USE portfolio_db;');

    const seedSqlPath = path.join(__dirname, '../seed.sql');
    const seedSql = fs.readFileSync(seedSqlPath, 'utf8');
    
    console.log('Running seed.sql...');
    await conn.query(seedSql);
    console.log('✅ Database seeded successfully!');
    
    await conn.end();
  } catch (err) {
    console.error('❌ Error executing DB scripts:', err);
  }
})();
