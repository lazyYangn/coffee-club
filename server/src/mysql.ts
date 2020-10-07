import { createConnection, createPool, PoolConnection } from 'mysql'
const config = require('../config')

// export const connection = createConnection({
const configDb = {
  connectionLimit: config.db_limit,
  host: config.db_host,
  user: config.db_user,
  password: config.db_password,
  database: config.db_database,
}

const pool = createPool(configDb)

interface TxCallback {
  (conn: PoolConnection): Promise<any>[]
}

interface NoConnOptions {
  conn: PoolConnection
  sql: any
  params?: any
}

export const Ping = () => {
  return new Promise((resolve, reject) => {
    pool.getConnection((err, connection) => {
      if (err) reject(err)
      else {
        connection.ping((e) => {
          if (e) {
            console.log('数据库连接成功')
            reject(e)
          }
          console.log('数据库连接成功')
          resolve('database is ping !')
        })
      }
    })
  })
}

export const Do = (sql: any, params?: any) => {
  return new Promise((resolve, reject) => {
    pool.getConnection((err, connection) => {
      if (err) {
        reject(err)
      }
      connection.query(sql, params, (err, rows) => {
        if (err) {
          reject(err)
        } else {
          resolve(rows)
          connection.release()
        }
      })
    })
  })
}

export const DoNoConn = ({ conn, sql, params }: NoConnOptions) => {
  return new Promise((resolve, reject) => {
    conn.query(sql, params, (err, rows) => {
      if (err) {
        reject(err)
      } else {
        resolve(rows)
      }
    })
  })
}

export const FindFrist = (sql: any, params?: any) => {
  return new Promise((resolve, reject) => {
    pool.getConnection((err, connection) => {
      if (err) {
        reject(err)
      }
      connection.query(sql, params, (err, rows) => {
        if (err) {
          reject(err)
        } else {
          resolve(rows.length > 0 ? rows[0] : null)
          connection.release()
        }
      })
    })
  })
}
export const DoTx = (callback: TxCallback) => {
  return new Promise((resolve, reject) => {
    pool.getConnection((err, connection) => {
      if (err) reject(err)
      connection.beginTransaction((err) => {
        if (err) {
          reject(err)
        }
        const p = callback(connection)
        Promise.all(p)
          .then(() => {
            connection.commit(function (err) {
              if (err) {
                connection.rollback(() => console.log('*** this db action rollback! ***'))
                reject(err)
              }
              resolve({
                code: 1,
              })
              connection.release()
            })
          })
          .catch((error) => {
            connection.rollback(() => console.log('*** this db action rollback! ***'))
            reject(error)
          })
      })
    })
  })
}
