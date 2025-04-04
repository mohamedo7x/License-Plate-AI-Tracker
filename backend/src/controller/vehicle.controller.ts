import { Request, Response } from 'express'
import { executeNonQuery, executeSingleQuery } from '../utils/orm.util'
import { Vehicle } from '../model/vehicle.model'
import { RowDataPacket } from 'mysql2'
import { ValidationError } from '../middleware/errorHandler'

interface VehicleRow extends Vehicle, RowDataPacket {}

export const createVehicle = async (
  req: Request,
  res: Response,
): Promise<void> => {
  try {
    const { Manufacturer, model, color, year } = req.body

    const insertQuery = `
      INSERT INTO Vehicles (Manufacturer, model, color, year)
      VALUES (?, ?, ?, ?)
    `
    const insertResult = await executeNonQuery(insertQuery, [
      Manufacturer,
      model,
      color,
      year,
    ])

    if (!insertResult.success) {
      throw new Error('Failed to create vehicle')
    }

    const getQuery = `
      SELECT * FROM vehicles 
      WHERE id = LAST_INSERT_ID()
    `
    const getResult = await executeSingleQuery<VehicleRow>(getQuery)

    if (!getResult.success || !getResult.data || getResult.data.length === 0) {
      throw new Error('Failed to retrieve created vehicle')
    }

    res.status(201).json({
      success: true,
      data: getResult.data[0],
    })
  } catch (error) {
    if (error instanceof ValidationError) {
      res.status(400).json({
        success: false,
        error: error.message,
      })
    } else {
      console.error('Error creating vehicle:', error)
      res.status(500).json({
        success: false,
        error: 'Internal server error',
      })
    }
  }
}
