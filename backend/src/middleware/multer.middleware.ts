import multer from 'multer'
import path from 'path'
import crypto from 'crypto'
import { Request } from 'express'
import fs from 'fs'
import { promisify } from 'util'

const storage = multer.memoryStorage()

const fileFilter = (req: Request, file: Express.Multer.File, cb: multer.FileFilterCallback) => {
  if (file.mimetype.startsWith('image/')) {
    cb(null, true)
  } else {
    cb(new Error('Only image files are allowed'))
  }
}

const upload_middleware = multer({
  storage,
  fileFilter,
  limits: {
    fileSize: 5 * 1024 * 1024, 
  },
})

export const uploadFile = upload_middleware.single('img_profile')

export const saveUploadedFile = async (req: Request): Promise<string> => {
  if (!req.file) {
    throw new Error('No file uploaded')
  }

  const filename = crypto.randomBytes(10).toString('hex') + path.extname(req.file.originalname)
  

  let destination: string
  if (req.originalUrl.includes('/police')) {
    destination = path.join(__dirname, '..', 'uploads', 'images', 'police_users')
  } else if (req.originalUrl.includes('/admin')) {
    destination = path.join(__dirname, '..', 'uploads', 'images', 'admin_users')
  } else {
    throw new Error('Invalid upload destination')
  }

  if (!fs.existsSync(destination)) {
    fs.mkdirSync(destination, { recursive: true })
  }

  const filePath = path.join(destination, filename)

  try {
    await promisify(fs.writeFile)(filePath, req.file.buffer)
    
    if (!fs.existsSync(filePath)) {
      throw new Error('File was not written successfully')
    }

    return filename
  } catch (error) {
    if (fs.existsSync(filePath)) {
      fs.unlinkSync(filePath)
    }
    throw error
  }
}
