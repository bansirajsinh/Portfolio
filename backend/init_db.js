const mysql = require('mysql2/promise');
const fs = require('fs');
const path = require('path');
require('dotenv').config();

(async () => {
  try {
    const isCloudDb = process.env.DB_HOST && process.env.DB_HOST !== 'localhost' && process.env.DB_HOST !== '127.0.0.1';
    const dbName = process.env.DB_NAME || 'portfolio_db';
    
    const connectionConfig = {
      host: process.env.DB_HOST || 'localhost',
      port: parseInt(process.env.DB_PORT) || 3306,
      user: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      multipleStatements: true,
      ssl: process.env.DB_SSL === 'true' ? { rejectUnauthorized: false } : undefined
    };

    if (isCloudDb) {
      connectionConfig.database = dbName;
    }

    const conn = await mysql.createConnection(connectionConfig);
    console.log(`Successfully connected to database server (${connectionConfig.host}).`);

    const schemaSqlPath = path.join(__dirname, '../schema.sql');
    let schemaSql = fs.readFileSync(schemaSqlPath, 'utf8');
    
    if (isCloudDb) {
      console.log('Detected cloud database. Preparing database-agnostic SQL statements...');
      // Remove CREATE DATABASE and USE statements from schemaSql
      schemaSql = schemaSql.replace(/CREATE DATABASE[\s\S]*?USE\s+\w+;/i, '');
    }

    console.log('Running schema.sql...');
    await conn.query(schemaSql);
    console.log('✅ Schema executed successfully!');

    const seedSqlPath = path.join(__dirname, '../seed.sql');
    let seedSql = fs.readFileSync(seedSqlPath, 'utf8');

    if (isCloudDb) {
      // Remove USE statements from seedSql
      seedSql = seedSql.replace(/USE\s+\w+;/i, '');
    } else {
      // Select the DB manually on local
      await conn.query(`USE ${dbName};`);
    }

    console.log('Running seed.sql...');
    await conn.query(seedSql);
    console.log('✅ Database seeded successfully!');
    
    await conn.end();
  } catch (err) {
    console.error('❌ Error executing DB scripts:', err);
  }
})();
