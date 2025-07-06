import asyncHandler from '../middleware/asyncHandler'
import { Request, Response } from 'express'
import { executeSingleQuery , executeNonQuery, executeQuery } from '../utils/orm.util'
import bcrypt from 'bcrypt'
import { generateUserJWTToken } from '../auth/user.access'
import { IUser } from '../model/default.user'

export const register = asyncHandler(async (req: Request, res: Response) => {
  const { national_id, email, password } = req.body
  const fetchIsUserExisits = await executeQuery(
    'SELECT * FROM user_accounts WHERE national_id = ? OR email = ?',
    [national_id, email],
  )
  const fetchNationalIdData = await executeSingleQuery(
    'SELECT * FROM person where national_id = ?',
    [national_id],
  )
  const isUserExists = fetchIsUserExisits.data?.length
  const isNationalIdExsits = fetchNationalIdData.data?.length
  if (isUserExists === 1) {
    res.status(409).json({
      sucess:false,
      message:
        'A user with the provided credentials already exists. Please use a different national ID or email, or proceed to login if you already have an account.',
    })
    return
  }
  if (!isNationalIdExsits) {
    res.status(404).json({
      sucess:false,
      message:
        'No user found with the provided national ID. Please verify the number and try again.',
    })
    return
  }
 const hash_password = await bcrypt.hash(password,parseInt(process.env.SALT_PASSWORD || '10'),)
  const result = await executeNonQuery("INSERT INTO user_accounts (national_id , email,password) VALUES (?,?,?)",[national_id, email , hash_password])
  if (result.success) {
   res.status(201).json({
    sucess:true,
    message: 'User account has been successfully created.',
  });
}
  
})

export const login = asyncHandler(async (req: Request, res: Response) => {
  const {email , password} = req.body;
  const userData = await executeSingleQuery<IUser>("SELECT * FROM user_accounts WHERE email = ?", [email ]);
  if (userData.data?.length === 0) {
   res.status(401).json({
    sucess:false,
    message: 'Invalid email or password. Please check your credentials and try again.',
  });
  return;
  }
  const user_password = userData.data ? userData.data[0].password : new Error('Somthing Happend');
  const correct_password = await bcrypt.compare(password ,user_password);

  if(!correct_password){
    res.status(401).json({
      sucess:false,
    message: 'Invalid email or password. Please check your credentials and try again.',
  });
  return;
  }
  if(userData && userData.data){
    const user:IUser[] = userData.data;
    const token = generateUserJWTToken(user[0]);
    res.status(200).json({
      sucess:true,
      token,
    })
  }

})
