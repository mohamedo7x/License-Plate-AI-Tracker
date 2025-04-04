import { Request, Response, NextFunction } from 'express'
import { extractJWTToken, validateJWTToken } from '../auth/user.access'
import { isAdmin, isSuperAdmin } from '../auth/admin.access'
import {
  UnauthorizedError,
  ForbiddenError,
  ValidationError,
} from './errorHandler'

interface JWTDecoded {
  id: number
  username: string
  role_id: number
}

interface ResponseWithUser extends Response {
  locals: {
    user?: JWTDecoded
  }
}

export const validateAdminToken = async (
  req: Request,
  res: ResponseWithUser,
  next: NextFunction,
): Promise<void> => {
  try {
    const token = extractJWTToken(req)
    if (!token) {
      throw new UnauthorizedError('No token provided')
    }

    const decoded = validateJWTToken(token) as JWTDecoded
    if (!decoded || !decoded.id) {
      throw new UnauthorizedError('Invalid token format')
    }

    const isUserAdmin = await isAdmin(decoded.id)
    const isUserSuperAdmin = await isSuperAdmin(decoded.id)
    if (!isUserAdmin && !isUserSuperAdmin) {
      throw new ForbiddenError('Access denied. Admin privileges required.')
    }

    res.locals.user = decoded
    next()
  } catch (error) {
    next(error)
  }
}

export const validateCreateAdminBody = (
  req: Request,
  res: Response,
  next: NextFunction,
): void => {
  try {
    const { name, email, password_hash } = req.body

    if (!name || !email || !password_hash) {
      throw new ValidationError(
        'Missing required fields: name, email, password_hash',
      )
    }

    if (typeof name !== 'string' || name.trim().length < 2) {
      throw new ValidationError('Name must be at least 2 characters long')
    }

    if (!email.includes('@')) {
      throw new ValidationError('Email must contain @ symbol')
    }

    const [localPart, domain] = email.split('@')

    if (!localPart || !domain) {
      throw new ValidationError('Invalid email format')
    }

    if (localPart.length < 2) {
      throw new ValidationError(
        'Email local part must be at least 2 characters',
      )
    }

    if (!domain.includes('.')) {
      throw new ValidationError('Email domain must contain a dot (.)')
    }

    const [domainName, extension] = domain.split('.')

    if (!domainName || !extension) {
      throw new ValidationError('Invalid email domain format')
    }

    if (extension.length < 2) {
      throw new ValidationError('Email extension must be at least 2 characters')
    }

    if (typeof password_hash !== 'string' || password_hash.length < 6) {
      throw new ValidationError('Password must be at least 6 characters long')
    }

    next()
  } catch (error) {
    next(error)
  }
}

export const validateUpdateAdminBody = (
  req: Request,
  res: Response,
  next: NextFunction,
): void => {
  try {
    const { name, email, status } = req.body

    if (!name && !email && !status) {
      throw new ValidationError('At least one field is required for update')
    }

    if (name && (typeof name !== 'string' || name.trim().length < 2)) {
      throw new ValidationError('Name must be at least 2 characters long')
    }

    if (email) {
      if (!email.includes('@')) {
        throw new ValidationError('Email must contain @ symbol')
      }

      const [localPart, domain] = email.split('@')

      if (!localPart || !domain) {
        throw new ValidationError('Invalid email format')
      }

      if (localPart.length < 2) {
        throw new ValidationError(
          'Email local part must be at least 2 characters',
        )
      }

      if (!domain.includes('.')) {
        throw new ValidationError('Email domain must contain a dot (.)')
      }

      const [domainName, extension] = domain.split('.')

      if (!domainName || !extension) {
        throw new ValidationError('Invalid email domain format')
      }

      if (extension.length < 2) {
        throw new ValidationError(
          'Email extension must be at least 2 characters',
        )
      }
    }

    if (status && !['active', 'inactive'].includes(status)) {
      throw new ValidationError(
        'Invalid status value. Allowed values: active, inactive',
      )
    }

    next()
  } catch (error) {
    next(error)
  }
}

export const validateAdminId = (
  req: Request,
  res: Response,
  next: NextFunction,
): void => {
  try {
    const { id } = req.params
    const adminId = parseInt(id)

    if (isNaN(adminId) || adminId <= 0) {
      throw new ValidationError('Invalid admin ID format')
    }

    req.params.id = adminId.toString()
    next()
  } catch (error) {
    next(error)
  }
}

export const validateLoginBody = (
  req: Request,
  res: Response,
  next: NextFunction,
): void => {
  try {
    const { email, password } = req.body

    if (!email || !password) {
      throw new ValidationError('Missing required fields: email, password')
    }

    if (!email.includes('@')) {
      throw new ValidationError('Email must contain @ symbol')
    }

    const [localPart, domain] = email.split('@')

    if (!localPart || !domain) {
      throw new ValidationError('Invalid email format')
    }

    if (localPart.length < 2) {
      throw new ValidationError(
        'Email local part must be at least 2 characters',
      )
    }

    if (!domain.includes('.')) {
      throw new ValidationError('Email domain must contain a dot (.)')
    }

    const [domainName, extension] = domain.split('.')

    if (!domainName || !extension) {
      throw new ValidationError('Invalid email domain format')
    }

    if (extension.length < 2) {
      throw new ValidationError('Email extension must be at least 2 characters')
    }

    if (typeof password !== 'string' || password.length < 6) {
      throw new ValidationError('Password must be at least 6 characters long')
    }

    next()
  } catch (error) {
    next(error)
  }
}
