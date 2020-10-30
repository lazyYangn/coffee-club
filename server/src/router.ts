import { Express } from 'express'
import * as api from './api'
import * as middleware from './middleware'

export const router = (app: Express) => {
  app.get('/', api.root)

  app.get('/api', api.defaultApi)

  app.post('/api/login', api.login)

  app.post('/api/register', api.register)

  app.post('/api/addfoodlike', api.addfoodlike)

  app.post('/api/addfoodcart', api.addfoodcart)

  app.post('/api/resetcart', api.resetcart)

  app.post('/api/createorder', api.createorder)

  app.post('/api/usercommittext', api.usercommittext)

  app.post("/api/upload", middleware.upload.single("file"), api.upload)

  app.post('/api/removeorder', api.removeorder)

  app.post('/api/changestatus', api.changeStatus)
}
