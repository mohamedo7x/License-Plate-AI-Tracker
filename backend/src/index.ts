import express, { Response } from 'express'
import errorHandler from 'errorhandler'
import dotenv from 'dotenv'
import { getConnection, StartConnectionToDb } from './database/Database'
import mainRoute from './routes/index'
import cors from 'cors'
import path from 'path'
import { errorHandler as customErrorHandler } from './middleware/errorHandler'
import logger from './utils/logger'
import socketio from 'socket.io'
import http from 'http'
import { add, getClientCount, remove } from './utils/clients'
const app = express()

app.use(express.json())
app.use(cors())
app.use(express.static(path.join(__dirname, 'images')))

app.use(
  '/uploads/images',
  express.static(path.join(__dirname, 'uploads', 'images')),
)

const httpserver = http.createServer(app)
const io = new socketio.Server(httpserver)
// SOCKET IO SERVER
io.on('connection', (socket) => {
  add(socket)
  socket.on('disconnect', () => {
    remove(socket)
  })
  socket.on('getAllClients', () => {
    const clients = getClientCount()
    console.log('All clients:', clients)
  })
  socket.on('login', (data) => {
    console.log('User logged in:', data)
    socket.emit('loginSuccess', { message: 'Login successful' })
  })
})

app.use((req, res, next) => {
  const startTime = new Date()
  res.on('finish', () => {
    const endTime = new Date()
    const responseTime = endTime.getTime() - startTime.getTime()

    interface LogData {
      method: string
      url: string
      status: number
      responseTime: string
      userAgent: string | undefined
      ip: string | undefined
      requestBody?: any
      requestQuery?: any
      requestParams?: any
    }

    const logData: LogData = {
      method: req.method,
      url: req.url,
      status: res.statusCode,
      responseTime: `${responseTime}ms`,
      userAgent: req.get('user-agent'),
      ip: req.ip,
    }

    if (req.method !== 'GET' && req.body && Object.keys(req.body).length > 0) {
      logData.requestBody = req.body
    }

    if (req.query && Object.keys(req.query).length > 0) {
      logData.requestQuery = req.query
    }

    if (req.params && Object.keys(req.params).length > 0) {
      logData.requestParams = req.params
    }

    logger.http('HTTP Request', logData)
  })

  next()
})

dotenv.config()

app.get('/healthz', (_, response: Response): void => {
  response.status(200).send('server work')
})

if (process.env.NODE_ENV === 'development') {
  app.use(errorHandler())
}

// ************** ROUTES ************** //


app.use(mainRoute)

app.use(customErrorHandler)

const startServer = async () => {
  try {
    await StartConnectionToDb()
    app.get('/isDbAlive', async (req, res) => {
      try {
        const connection = await getConnection()
        const [rows] = await connection.execute(
          "SELECT 'Hello, World! FROM MYSQL' AS message",
        )
        res.json(rows)
      } catch (error) {
        res.status(500).json({ error: 'Database connection failed' })
      }
    })

    const port = process.env.PORT
    httpserver.listen(port, () => {
      console.log('Server started on port', port)
    })
  } catch (error) {
    console.error('Failed to start server:', error)
    process.exit(1)
  }
}

startServer()
