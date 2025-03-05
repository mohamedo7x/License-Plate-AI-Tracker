import express from 'express';
import dot from 'dotenv';
import { initDb } from './datastore';
const app = express();
dot.config();

app.listen(process.env.PORT || 8080, async () => {
  await initDb();
  console.log(`server work http://localhost:${process.env.PORT}`);
});
