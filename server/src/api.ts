import { Do, FindFrist } from './mysql'
import crypto from 'crypto'

export const root = (req: any, resp: any) => {
  resp.send('hello coffee-club')
}
export const defaultApi = (req: any, resp: any) => {
  resp.send('hello API')
}

export const login = async (req: any, resp: any) => {
  console.log(req.body)
  let p = req.body
  let res = await FindFrist('select * from user where u_id = ?', [p.id])
  /* 
        使用nodejs连接数据库查询表后，拿到的数据是一个数组，数组里面是JSON格式的数据，
        但是每个JSON前面都有一个RowDataPacket,这就导致前端获取到这些数据后不得不进行一些格式处理，
        */
  if (res) {
    let jsonRes = JSON.parse(JSON.stringify(res))
    if (jsonRes.pwd === p.pwd) {
      let md5 = crypto.createHash('md5')
      let token = md5.update(jsonRes.u_id + jsonRes.pwd).digest('hex')
      resp.json({
        code: 1,
        msg: '登录成功',
        data: {
          userId: jsonRes.u_id,
          userName: jsonRes.name,
          token,
          userAva: jsonRes.avatar,
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
    let res = await Do('insert into user(u_id,name,pwd) values (?,?,?)', [p.mail, p.username, p.pwd])
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
export const addfoodlike = async (req: any, resp: any) => {
  const p = req.body
  let res = await FindFrist('select * from favorite where u_id = ? and food_id = ?', [p.u_id, p.food_id])
  let jonsObj = JSON.parse(JSON.stringify(res))
  if (jonsObj) {
    if (p.islike == 1) {
      Do('update favorite set islike = 0 and sysdate = (select now()) where u_id = ? and food_id = ?', [p.u_id, p.food_id])
    } else if (p.islike == 0) {
      Do('update favorite set islike = 1 and sysdate = (select now()) where u_id = ? and food_id = ?', [p.u_id, p.food_id])
    }
  } else {
    Do('insert into favorite (u_id,food_id,islike,sysdate) values (?,?,1,(select now()))', [p.u_id, p.food_id])
  }
  resp.json({
    code: 3,
    msg: '成功',
    data: {},
  })
}
