import { Request, RequestHandler } from 'express';
import morgan from 'morgan';

const LOGGER = {
  info: (message: string) => console.log('LOGGER INFO:', JSON.stringify(message)),
};
const customMorganFormat = morgan(
  (tokens, req: Request, res) => {
    return JSON.stringify({
      method: tokens.method(req, res),
      path: tokens.url(req, res),
      body: req.body && Object.keys(req.body).length ? req.body : undefined,
      status: tokens.status(req, res),
      responseTime: `${tokens['response-time'](req, res)} ms`,
    });
  },
  {
    stream: {
      write: message => LOGGER.info(JSON.parse(message)),
    },
  }
);
export const loggerMiddleware: RequestHandler = (req, res, next) => {
  customMorganFormat(req, res, () => {});
  next();
};
