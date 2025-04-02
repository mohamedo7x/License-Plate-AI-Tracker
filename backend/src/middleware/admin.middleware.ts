import { Request, Response, NextFunction } from 'express'
import { extractJWTToken, validateJWTToken } from '../auth/auth.access'
import { isAdmin } from '../auth/auth.access'


interface JWTDecoded {
  id: number;
  username: string;
  role_id: number;
}

interface ResponseWithUser extends Response {
  locals: {
    user?: JWTDecoded;
  };
}

export const validateAdminToken = async (
  req: Request,
  res: ResponseWithUser,
  next: NextFunction,
): Promise<void> => {
  try {
    const token = extractJWTToken(req)
    if (!token) {
      res.status(401).json({ error: 'No token provided' })
      return
    }

    const decoded = validateJWTToken(token) as JWTDecoded
    if (!decoded || !decoded.id) {
      res.status(401).json({ error: 'Invalid token format' })
      return
    }

    const isUserAdmin = await isAdmin(decoded.id)
    if (!isUserAdmin) {
      res
        .status(403)
        .json({ error: 'Access denied. Admin privileges required.' })
      return
    }

    res.locals.user = decoded
    next()
  } catch (error) {
    res.status(401).json({ error: 'Authentication failed' })
  }
}

export const validateCreateAdminBody = (
  req: Request,
  res: Response,
  next: NextFunction,
): void => {
  const { name, email, password_hash } = req.body

  if (!name || !email || !password_hash) {
    res.status(400).json({
      error: 'Missing required fields',
      required: ['name', 'email', 'password_hash'],
    })
    return
  }

  if (typeof name !== 'string' || name.trim().length < 2) {
    res.status(400).json({ error: 'Name must be at least 2 characters long' })
    return
  }

  if (!email.includes('@')) {
    res.status(400).json({ error: 'Email must contain @ symbol' })
    return
  }

  const [localPart, domain] = email.split('@')

  if (!localPart || !domain) {
    res.status(400).json({ error: 'Invalid email format' })
    return
  }

  if (localPart.length < 2) {
    res
      .status(400)
      .json({ error: 'Email local part must be at least 2 characters' })
    return
  }

  if (!domain.includes('.')) {
    res.status(400).json({ error: 'Email domain must contain a dot (.)' })
    return
  }

  const [domainName, extension] = domain.split('.')

  if (!domainName || !extension) {
    res.status(400).json({ error: 'Invalid email domain format' })
    return
  }

  if (extension.length < 2) {
    res
      .status(400)
      .json({ error: 'Email extension must be at least 2 characters' })
    return
  }


  if (typeof password_hash !== 'string' || password_hash.length < 60) {
    res.status(400).json({ error: 'Invalid password hash format' })
    return
  }

  next()
}

export const validateUpdateAdminBody = (
  req: Request,
  res: Response,
  next: NextFunction,
): void => {
  const { name, email, status } = req.body

  if (!name && !email && !status) {
    res.status(400).json({
      error: 'At least one field is required for update',
      allowed: ['name', 'email', 'status'],
    })
    return
  }


  if (name && (typeof name !== 'string' || name.trim().length < 2)) {
    res.status(400).json({ error: 'Name must be at least 2 characters long' })
    return
  }


  if (email) {
    if (!email.includes('@')) {
      res.status(400).json({ error: 'Email must contain @ symbol' })
      return
    }

    const [localPart, domain] = email.split('@')

    if (!localPart || !domain) {
      res.status(400).json({ error: 'Invalid email format' })
      return
    }

    if (localPart.length < 2) {
      res
        .status(400)
        .json({ error: 'Email local part must be at least 2 characters' })
      return
    }

    if (!domain.includes('.')) {
      res.status(400).json({ error: 'Email domain must contain a dot (.)' })
      return
    }

    const [domainName, extension] = domain.split('.')

    if (!domainName || !extension) {
      res.status(400).json({ error: 'Invalid email domain format' })
      return
    }

    if (extension.length < 2) {
      res
        .status(400)
        .json({ error: 'Email extension must be at least 2 characters' })
      return
    }
  }


  if (status && !['active', 'inactive'].includes(status)) {
    res.status(400).json({
      error: 'Invalid status value',
      allowed: ['active', 'inactive'],
    })
    return
  }

  next()
}

export const validateAdminId = (
  req: Request,
  res: Response,
  next: NextFunction,
): void => {
  const { id } = req.params
  const adminId = parseInt(id)

  if (isNaN(adminId) || adminId <= 0) {
    res.status(400).json({ error: 'Invalid admin ID format' })
    return
  }

  req.params.id = adminId.toString()
  next()
}

export const validateLoginBody = (
  req: Request,
  res: Response,
  next: NextFunction,
): void => {
  const { email, password } = req.body

  if (!email || !password) {
    res.status(400).json({
      error: 'Missing required fields',
      required: ['email', 'password'],
    })
    return
  }


  if (!email.includes('@')) {
    res.status(400).json({ error: 'Email must contain @ symbol' })
    return
  }

  const [localPart, domain] = email.split('@')

  if (!localPart || !domain) {
    res.status(400).json({ error: 'Invalid email format' })
    return
  }

  if (localPart.length < 2) {
    res
      .status(400)
      .json({ error: 'Email local part must be at least 2 characters' })
    return
  }

  if (!domain.includes('.')) {
    res.status(400).json({ error: 'Email domain must contain a dot (.)' })
    return
  }

  const [domainName, extension] = domain.split('.')

  if (!domainName || !extension) {
    res.status(400).json({ error: 'Invalid email domain format' })
    return
  }

  if (extension.length < 2) {
    res
      .status(400)
      .json({ error: 'Email extension must be at least 2 characters' })
    return
  }

  if (typeof password !== 'string' || password.length < 6) {
    res.status(400).json({ error: 'Password must be at least 6 characters long' })
    return
  }

  next()
}
