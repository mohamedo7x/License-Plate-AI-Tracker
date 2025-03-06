import { UserDao } from '../datastore/dao/userDao';
import { User } from '../model/User';
import { ExpressHandler, ExpressHandlerWithParams } from '../types';
import { Request, Response } from 'express';

export class UserHandler {
  private userDao: UserDao;

  constructor(userDao: UserDao) {
    this.userDao = userDao;
  }

  createUser: ExpressHandler<User, { message?: string }> = async (req, res) => {
    try {
      res.status(201).json({
        message: 'User Created Sucessfuly',
      });

      return;
    } catch (error) {
      res.status(500).json({ error: 'Error creating user' });
    }
  };

  findUserById: ExpressHandlerWithParams<{ id: string }, {}, User | null> = async (req, res) => {
    try {
    } catch (error) {
      res.status(500).json({ error: 'Error retrieving user' });
    }
  };

  findUserByUsername: ExpressHandlerWithParams<{ username: string }, {}, User | null> = async (
    req,
    res
  ) => {
    try {
    } catch (error) {
      res.status(500).json({ error: 'Error retrieving user' });
    }
  };

  listAllUsers: ExpressHandler<{}, User[]> = async (_req, res) => {
    try {
    } catch (error) {
      res.status(500).json({ error: 'Error retrieving users' });
    }
  };

  updateUser: ExpressHandlerWithParams<{ id: string }, Partial<User>, User | null> = async (
    req,
    res
  ) => {
    try {
    } catch (error) {
      res.status(500).json({ error: 'Error updating user' });
    }
  };

  deleteUser: ExpressHandlerWithParams<{ id: string }, {}, boolean | { error: string }> = async (
    req,
    res
  ) => {
    try {
    } catch (error) {
      res.status(500).json({ error: 'Error deleting user' });
    }
  };

  findUserByPhoneNumber: ExpressHandlerWithParams<{ phoneNumber: string }, {}, User | null> =
    async (req, res) => {
      try {
      } catch (error) {
        res.status(500).json({ error: 'Error retrieving user' });
      }
    };

  updateUserLastLogin: ExpressHandlerWithParams<{ id: string }, {}, boolean | { error: string }> =
    async (req, res) => {
      try {
      } catch (error) {
        res.status(500).json({ error: 'Error updating last login' });
      }
    };

  listRecentUsers: ExpressHandlerWithParams<{ limit: string }, {}, User[]> = async (req, res) => {
    try {
    } catch (error) {
      res.status(500).json({ error: 'Error retrieving recent users' });
    }
  };
}
