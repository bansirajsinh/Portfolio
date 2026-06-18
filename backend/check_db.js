const mysql = require('mysql2/promise');
require('dotenv').config();

(async () => {
  try {
    const conn = await mysql.createConnection({
      host: process.env.DB_HOST || 'localhost',
      port: parseInt(process.env.DB_PORT) || 3306,
      user: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      database: process.env.DB_NAME || 'portfolio_db',
    });
    console.log('Successfully connected to DB.');
    const [tables] = await conn.query('SHOW TABLES');
    console.log('Tables:', tables);
    for (const table of tables) {
      const tableName = Object.values(table)[0];
      const [[countObj]] = await conn.query(`SELECT COUNT(*) as cnt FROM \`${tableName}\``);
      console.log(`Table ${tableName}: ${countObj.cnt} rows`);
    }
    await conn.end();
  } catch (err) {
    console.error('Error querying DB:', err);
  }
})();
