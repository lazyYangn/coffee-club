import { Do, FindFrist } from './mysql'
import crypto from 'crypto'
const config = require('../config')

export const root = (req: any, resp: any) => {
  resp.send('hello coffee-club')
}
export const defaultApi = (req: any, resp: any) => {
  resp.send('hello API')
}

export const login = async (req: any, resp: any) => {
  console.log(req.body)
  let p = req.body
  let res = await FindFrist('select * from user where id = ?', [p.id])
  /* 
        使用nodejs连接数据库查询表后，拿到的数据是一个数组，数组里面是JSON格式的数据，
        但是每个JSON前面都有一个RowDataPacket,这就导致前端获取到这些数据后不得不进行一些格式处理，
        */
  if (res) {
    let jsonRes = JSON.parse(JSON.stringify(res))
    if (jsonRes.pwd === p.password) {
      let md5 = crypto.createHash('md5')
      let token = md5.update(jsonRes.id + jsonRes.pwd).digest('hex')
      resp.json({
        code: 1,
        msg: '登录成功',
        data: {
          userId: jsonRes.id,
          userName: jsonRes.name,
          token,
        },
      })
    } else {
      resp.json({
        code: 2,
        msg: '密码错误',
        data: '',
      })
    }
  } else {
    resp.json({
      code: 3,
      msg: '无此用户',
      data: '',
    })
  }
}

export const register = async (req: any, resp: any) => {
  try {
    let p = req.body
    //思路直接插入数据库语句 放在trycatch中 如果有错直接报失败 如果成功判断affectedRows==1
    let res = await Do('insert into user values (?,?,?)', [p.id, p.name, p.pwd])
    let JsonRes = JSON.parse(JSON.stringify(res))
    if (JsonRes.affectedRows == 1) {
      resp.json({
        code: 1,
        msg: '注册成功',
        data: {
          userId: p.id,
          userName: p.name,
        },
      })
    } else {
      resp.json({
        code: 2,
        msg: '注册失败(原因不详)',
        data: '',
      })
    }
  } catch (error) {
    resp.json({
      code: 2,
      msg: '注册失败',
      data: '',
    })
  }
}
