import { app, gql_server } from './server'
import { Ping } from './mysql'
const config = require('../config')

Ping()
  .then((res) => {
    console.log(res)
  })
  .catch((err) => {
    console.log(err)
  })

app.listen(config.port, () =>
  console.log(`
***********************************************************************
    express-app-ts start listen port:${config.port};

    you can visit url : ${config.url + ':' + config.port};

    graphql path : ${config.url + ':' + config.port + gql_server.graphqlPath}
***********************************************************************
`)
)
