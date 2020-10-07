import { Do, FindFrist } from './mysql'

export const food = async (parent: any, args: any, context: any, info: any) => {
  try {
    let res = await FindFrist('select * from foods where food_id = ? ', [args.food_id])
    return res
  } catch (e) {
    return e
  }
}

export const type = async (parent: any, args: any, context: any, info: any) => {
  try {
    let res = await Do('select * from category where typeid = ? ', [parent.typeid])
    return res
  } catch (e) {
    return e
  }
}

export const foods = async (parent: any, args: any, context: any, info: any) => {
  try {
    let sql = 'select * from foods where 1=1 '
    sql += args.typeid ? " and typeid = '" + args.typeid + "' " : ''
    sql += ' and ( 1=1  '
    sql += args.food_name ? " and  food_name like '%" + args.food_name + "%' " : ''
    sql += args.food_desc ? " or food_desc like '%" + args.food_desc + "%'  " : ''
    sql += ' ) '
    sql += ' limit ?,?'
    let res = await Do(sql, [args.start, args.count])
    return res
  } catch (e) {
    return e
  }
}

export const category = async (parent: any, args: any, context: any, info: any) => {
  try {
    let sql = 'select * from category where typeid in (?) '
    let res = await Do(sql, [args.typeid])
    return res
  } catch (e) {
    return e
  }
}

export const foodsCategory = async (parent: any, args: any, context: any, info: any) => {
  try {
    let res = await Do('select * from foods where typeid = ? limit ? ', [parent.typeid, args.count])
    return res
  } catch (e) {
    return e
  }
}
export const homecategory = async (parent: any, args: any, context: any, info: any) => {
  try {
    let res = await Do('select * from category where parent_id = 0')
    return res
  } catch (e) {
    return e
  }
}
export const user = async (parent: any, args: any, context: any, info: any) => {
  try {
    let res = await FindFrist('select * from user where u_id = ?', [args.u_id])
    return res
  } catch (e) {
    return e
  }
}
export const favorite = async (parent: any, args: any, context: any, info: any) => {
  try {
    let res = await Do('select b.* from user_actions a,foods b where a.food_id = b.food_id and a.u_id = ? and a.type = 1  order by a.sysdate desc', [parent.u_id])
    return res
  } catch (e) {
    return e
  }
}
