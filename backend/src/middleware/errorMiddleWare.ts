import { ErrorRequestHandler } from 'express';

export const errHandler: ErrorRequestHandler = (err, _, res, __) => {
  if (process.env.S_STATUS === 'env') {
    res.status(500).send('Oops, an unexpected error occurred' + err);
    return;
  }
  res.status(500).send('Oops, an unexpected error occurred, please try again');
  return;
};
