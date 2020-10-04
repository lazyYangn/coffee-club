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
    sql += args.food_desc ? " and food_desc like '%" + args.food_desc + "%'  " : ''
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
export const favorite = async (parent: any, args: any, context: any, info: any) => {
  try {
    let res = await Do('select * from favorite')
    return res
  } catch (e) {
    return e
  }
}
