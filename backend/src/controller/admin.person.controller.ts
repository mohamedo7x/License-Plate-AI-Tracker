import asyncHandler from '../middleware/asyncHandler'
import { Request, Response } from 'express'
import { executeQuery } from '../utils/orm.util'
import { formatDate, formatDateV2 } from '../utils/dateFormat.util'

export const getPersonByID = asyncHandler(
  async (req: Request, res: Response) => {
    const { id } = req.params
    const query = `SELECT * FROM person WHERE national_id = ?`
    const person = await executeQuery(query, [id])
    if (person.data?.length === 0) {
      res.status(404).json({ message: 'Person not found' })
    }
    const personData = person.data
      ? person.data.map((person) => {
          return {
            ...person,
            date_of_birth: formatDateV2(person.date_of_birth),
            issue_date: formatDateV2(person.issue_date),
            expired_date: formatDateV2(person.expired_date),
            criminal_status:
              person.criminal_status === 1 ? 'مطلوب' : 'غير مطلوب',
          }
        })
      : []
    res.status(200).json({ person: personData })
  },
)

export const getPersons = asyncHandler(async (req: Request, res: Response) => {
  const page = parseInt(req.query.page as string) || 1
  const limit = parseInt(req.query.limit as string) || 10
  const offset = (page - 1) * limit

  const query = 'SELECT * FROM person LIMIT ? OFFSET ?'
  const persons = await executeQuery(query, [limit, offset])

  const PersonsData = persons.data
    ? persons.data.map((person) => {
        return {
          ...person,
          date_of_birth: formatDateV2(person.date_of_birth),
          issue_date: formatDateV2(person.issue_date),
          expired_date: formatDateV2(person.expired_date),
          criminal_status:
            person.criminal_status === 1 ? 'مطلوب' : 'غير مطلوب',
        }
      })
    : []
  res.status(200).json({
    success: true,
    page: page,
    limit: limit,
    data: PersonsData,
  })
})

export const changeCriminalStatus = asyncHandler(
  async (req: Request, res: Response) => {
    const { id } = req.params
    const { criminal_status } = req.body
    const query = `UPDATE person SET criminal_status = ? WHERE national_id = ?`
    const result = await executeQuery(query, [criminal_status, id])
    res.status(200).json({ message: 'Criminal status updated successfully' })
  },
)
