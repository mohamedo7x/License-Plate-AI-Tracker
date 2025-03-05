import express from 'express';
import dot from 'dotenv';

const app = express();
dot.config();

app.listen(process.env.PORT || 8080, () => {
  console.log(`server work http://localhost:${process.env.PORT}`);
});
