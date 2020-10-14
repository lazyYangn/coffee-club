import { ApolloServer, gql } from 'apollo-server-express'
import * as gr from './graphqlResolvers'

const config = require('../config')

const typeDefs = gql`
  type Query {
    hello: String
    food(food_id: Int!): Food
    foods(start: Int, count: Int, typeid: Int, food_name: String, food_desc: String): [Food]
    category(typeid: [Int]!): [Category]
    homecategory: [Category]
    user(u_id: String!): User
    usercart(u_id:String!) : [Food]
    userOrder(u_id:String!,start:Int!,count:Int!) : [Order]
  }
  type Food {
    food_id: Int
    food_name: String
    food_price: String
    food_title: String
    food_rate: Int
    food_count: Int
    food_desc: String
    food_pic: String
    typeid:String
    islike: Int
    type: Cate
    skus:[Dict]
    countbuy:Int
    cartskus:String
    id:Int
  }
  type Dict{
    id:String
    typeid:String
    name:String
    Cname:String
    dict_son:[DictSon]
  }
  type DictSon{
    id:String
    dictid:String
    Cname:String
  }
  type Cate {
    typeid: Int
    name: String
    title: String
  }
  type Category {
    typeid: Int
    name: String
    title: String
    desc: String
    cate_pic: String
    foods(count: Int!): [Food]
  }
  type User {
    u_id: String
    name: String
    favorite(food_id: Int): [Food]
  }
  type Order {
    id:String,
    pricesum:Float,
    countsum:Int,
    status:Int,
    orderdate:String,
    foodList:[Food]
}
`
const resolvers = {
  Query: {
    hello: () => 'hello coffee-club',
    food: gr.food,
    foods: gr.foods,
    category: gr.category,
    homecategory: gr.homecategory,
    user: gr.user,
    usercart:gr.usercart,
    userOrder:gr.userOrder,
  },
  Food: {
    type: gr.type,
    skus:gr.skus,
  },
  Dict:{
    dict_son:gr.dict_son
  },
  Category: {
    foods: gr.foodsCategory,
  },
  User: {
    favorite: gr.favorite,
  },
  Order:{
    orderdate:gr.formatOrderdate,
    foodList:gr.foodList
  }
}
export const server = new ApolloServer({
  typeDefs,
  resolvers,
  playground: config.gql_playground,
})
