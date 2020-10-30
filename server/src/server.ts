import express from 'express'
import bodyParser from 'body-parser'
import cors from 'cors'
import { server as gql_server } from './graphql'
import { router } from './router'
const config = require('../config')

const app = express()

const corsOptions = {
  orgin: '*',
  method: 'GET,POST',
  optionsSuccessStatus: 200,
}

app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())
app.use(cors(corsOptions))

gql_server.applyMiddleware({
  app,
  path: config.gql_url,
})

app.use("/html", express.static("./pages"))

app.use('/uploads', express.static('./assets/uploads'))

app.use('/imgs', express.static('./assets/imgs'))

router(app)

export { app, gql_server }
