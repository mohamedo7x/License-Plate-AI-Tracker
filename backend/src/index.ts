import express from 'express';
import dot from 'dotenv';
import { initDb } from './datastore';
import { loggerMiddleware } from './middleware/loggerMiddleWare';
import { Request, Response } from 'express';
const app = express();
dot.config();
app.use(loggerMiddleware);
app.use(express.json());
app.get('/', (_req: Request, res: Response) => {
  res.send('Welcome');
});

app.listen(process.env.PORT || 8080, async () => {
  await initDb();
  console.log(`server work http://localhost:${process.env.PORT}`);
});
