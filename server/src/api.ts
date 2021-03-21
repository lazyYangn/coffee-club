import { Do, FindFrist, DoNoConn, DoTx } from './mysql'
import crypto from 'crypto'

export const root = (req: any, resp: any) => {
  resp.send('hello coffee-club')
}
export const defaultApi = (req: any, resp: any) => {
  resp.send('hello API')
}

export const login = async (req: any, resp: any) => {
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
          imgpath: jsonRes.imgpath,
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
  if (jonsObj !== null) {
    if (p.islike == 0) {
      await Do('update favorite set islike = 1 where u_id = ? and food_id = ?', [p.u_id, p.food_id])
    }
    else if (p.islike == 1) {
      await Do('update favorite set islike = 0 where u_id = ? and food_id = ?', [p.u_id, p.food_id])
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
export const addfoodcart = async (req: any, resp: any) => {
  let p = req.body
  if (p.num === 0) {
    Do("delete from carts where u_id= ? and food_id=?", [p.userid, p.foodid])
  } else {
    if (!p.skus || p.skus.length <= 0) {
      DoTx((conn) => {
        const a = DoNoConn({
          conn,
          sql: "delete from carts where u_id= ? and food_id = ?",
          params: [p.userid, p.foodid],
        }).then(() => {
          return DoNoConn({
            conn,
            sql: "insert into carts (u_id,food_id,num,sysdate,skus) values (?,?,?,(select now()),?)",
            params: [p.userid, p.foodid, p.num, '']
          })
        })
        return [a]
      })
    } else {
      DoTx((conn) => {
        const a = DoNoConn({
          conn,
          sql: "delete from carts where u_id= ? and food_id = ?",
          params: [p.userid, p.foodid],
        }).then(() => {
          let sku = p.skus.join('_')
          return DoNoConn({
            conn,
            sql: "insert into carts (u_id,food_id,num,sysdate,skus) values (?,?,?,(select now()),?)",
            params: [p.userid, p.foodid, p.num, sku]
          })
        })
        return [a]
      })
    }

  }
  resp.json({
    code: 1,
    msg: '添加成功',
    data: {},
  })
}

export const delfoodcart = async (req: any, resp: any) => {
  let p = resp.body
  try {
    Do("delete from carts where u_id= ? and food_id=?", [p.userid, p.foodid])
  } catch (error) {

  }
}
  
export const resetcart = async (req: any, resp: any) => {
  let p = req.body
  try {
    let res = await Do("delete from carts where u_id= ?", [p.userid])
    resp.json({
      code: 1,
      msg: "操作成功",
      data: res
    })
  } catch (error) {
    resp.json({
      code: 3,
      msg: "操作失败",
      data: {
        error
      }
    })
  }

}

export const createorder = async (req: any, resp: any) => {
  const p = req.body
  try {
    let md5 = crypto.createHash('md5')
    let date = new Date()
    let id = md5.update(date.getUTCMilliseconds().toString()).digest('hex');
    await DoTx((conn) => {
      return [DoNoConn({
        conn,
        sql: "insert into `order` values (?,?,?,?,?,(select now())) ",
        params: [id, p.userid, 1, p.countSum, p.priceSum]
      }).then(() => {
        let arr: Promise<any>[] = []
        for (let t of p.orderlist) {
          let skus = t.skus.join('_')
          arr.push(DoNoConn({
            conn,
            sql: "insert into order_list (orderid,food_id,countbuy,food_name,price,skus,food_pic) values (?,?,?,?,?,?,?) ",
            params: [id, t.food_id, t.countbuy, t.food_name, t.food_price, skus, t.food_pic]
          }))
        }
        return Promise.all(arr)
      })]
    })
    resp.json({
      code: 1,
      msg: "创建成功",
      data: {}
    })
  } catch (e) {
    resp.json({
      code: 2,
      msg: "创建订单失败",
      data: {}
    })
  }
}
export const removeorder = async (req: any, resp: any) => {
  const p = req.body
  try {
    await DoTx((conn) => {
      const a = DoNoConn({
        conn,
        sql: "delete from `order` where u_id= ? and id = ?",
        params: [p.userid, p.id]
      }).then(() => {
        return DoNoConn({
          conn,
          sql: "delete from order_list where orderid= ?",
          params: [p.id]
        })
      })
      return [a]
    })
    resp.json({
      code: 1,
      msg: "创建成功",
      data: {}
    })
  } catch (e) {
    resp.json({
      code: 2,
      msg: "创建订单失败",
      data: {}
    })
  }
}
export const changeStatus = async (req: any, resp: any) => {
  const p = req.body
  try {
    await Do("update `order` set status = ? where u_id= ? and id = ?", [p.status, p.userid, p.id])
    resp.json({
      code: 1,
      msg: "修改成功",
      data: {}
    })
  } catch (e) {
    resp.json({
      code: 2,
      msg: "修改失败",
      data: {}
    })
  }
}
export const upload = async (req: any, resp: any) => {
  const { file: { filename }, body: { userid } } = req
  // console.log("上传后的文件名:" + filename)
  // console.log("上传者的用户名:" + userid)
  try {
    let res = await Do("update user set imgpath = ? where u_id = ? ", [filename, userid])
    let jsonObj = JSON.parse(JSON.stringify(res))
    if (jsonObj.affectedRows === 1) {
      resp.json({
        code: 1,
        msg: "上传成功",
        data: {
          filename,
        }
      })
    } else {
      resp.json({
        code: 2,
        msg: "上传失败(未知原因)",
        data: ""
      })
    }
  } catch (error) {
    resp.json({
      code: 3,
      msg: "上传失败",
      data: {
        error
      }
    })
  }
}

// 意见反馈
export const usercommittext = async (req: any, resp: any) => {
  const p = req.body
  let res = await FindFrist('select * from user_commit where userid = ?', [p.userid])
  let jonsObj = JSON.parse(JSON.stringify(res))
  try {
    if (jonsObj !== null) {
      await Do('update user_commit set committext = ? where userid = ?', [p.textareaVal, p.userid])
    } else {
      await Do('insert into user_commit values (?,?,(select now()))', [p.userid, p.textareaVal])
    }
    resp.json({
      code: 1,
      msg: "提交成功",
      data: ""
    })
  } catch (error) {
    resp.json({
      code: 2,
      msg: "提交失败",
      data: ""
    })
  }
}