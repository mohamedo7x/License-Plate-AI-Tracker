import express, { Response } from 'express'
import errorHandler from 'errorhandler'
import dotenv from 'dotenv'
import { getConnection, StartConnectionToDb } from './database/Database'
import mainRoute from './routes/index'
import cors from 'cors'
import path from 'path'
import morgan from 'morgan'
const app = express()

app.use(express.json())
app.use(cors())
app.use(express.static(path.join(__dirname, 'images')))
app.use(morgan('dev'))
dotenv.config()

app.get('/healthz', (_, response: Response): void => {
  response.status(200).send('Server Work')
})

if (process.env.NODE_ENV === 'development') {
  console.log('Dev Mode')
  app.use(errorHandler())
}

// ************** ROUTES ************** //
app.use(mainRoute)

const startServer = async () => {
  const db = await StartConnectionToDb()

  app.get('/isDbAlive', async (req, res) => {
    const connection = await getConnection()
    const [rows] = await connection.execute(
      "SELECT 'Hello, World! FROM MYSQL' AS message",
    )
    res.json(rows)
  })

  app.listen(process.env.PORT, () => {
    const port = process.env.PORT
    console.log('http://localhost:' + port)
  })
}

startServer()
