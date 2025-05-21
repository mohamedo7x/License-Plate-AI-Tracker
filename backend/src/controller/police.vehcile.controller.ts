import asyncHandler from '../middleware/asyncHandler'
import { Request, Response } from 'express'
import { executeQuery } from '../utils/orm.util'
import { saveUploadedFile, saveUploadedFiles } from '../middleware/multer.middleware'

export const createVehicleTicket = asyncHandler(
  async (req: Request, res: Response) => {
    const user = (req as any).user;

    let attachmentPaths: string[] = [];

    if (req.files && Array.isArray(req.files) && req.files.length > 0) {
      const savedFiles = await saveUploadedFiles(req);
      attachmentPaths = savedFiles.map(
        (filename) => `${filename}`
      );
      const query = `
        INSERT INTO violations 
        (police_id, plate_id, location, type, action, description, attachments , status )
        VALUES (?, ?, ?, ?, ?, ?,?,?)
      `;
      const values = [
        user.id,
        req.body.vehicle_plate,
        req.body.location,
        req.body.violation_type,
        req.body.action_taken,
        req.body.description,
        JSON.stringify(attachmentPaths),
        req.body.status,
      ];
      await executeQuery(query, values);
    }else {
        const query = `
            INSERT INTO violations 
            (police_id, plate_id, location, type, action, description , status )
            VALUES (?, ?, ?, ?, ?, ?,?)
        `;
        const values = [
            user.id,
            req.body.vehicle_plate,
            req.body.location,
            req.body.violation_type,
            req.body.action_taken,
            req.body.description,
            req.body.status || "",
        ];
        await executeQuery(query, values);
    }

    res.status(201).json({ success: true, message: "Ticket created" });
  }
);

export const getAllViolationTicket = asyncHandler(
  async (req: Request, res: Response) => {
    const query = `SELECT * FROM violation_type`
    const result = await executeQuery(query)
    res.status(200).json({
      data: result,
    })
  },
)


export const getAllViolationTicketActions = asyncHandler(
  async (req: Request, res: Response) => {
    const query = `SELECT * FROM violation_action`
    const result = await executeQuery(query)
    res.status(200).json({
      data: result,
    })
  },
)


export const searchForViolationsOnVehicle = asyncHandler( // here 
    async (req : Request , res : Response) => {
        const plate_id = req.params.plate_id;
        const query = `SELECT * FROM violations WHERE plate_id = ?`
        const result = await executeQuery(query, [plate_id])
        res.status(200).json({
            data: result,
        })
})