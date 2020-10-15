import { Express } from 'express'
import * as api from './api'

export const router = (app: Express) => {
  app.get('/', api.root)

  app.get('/api', api.defaultApi)

  app.post('/api/login', api.login)

  app.post('/api/register', api.register)

  app.post('/api/addfoodlike', api.addfoodlike)

  app.post('/api/addfoodcart', api.addfoodcart)
  
  app.post('/api/resetcart', api.resetcart)

  app.post('/api/createorder', api.createorder)

  app.post('/api/removeorder', api.removeorder)
}
