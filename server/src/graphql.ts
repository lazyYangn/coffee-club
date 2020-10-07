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
    status: Int
    type: Dict
  }
  type Dict {
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
    favorite: [Food]
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
  },
  Food: {
    type: gr.type,
  },
  Category: {
    foods: gr.foodsCategory,
  },
  User: {
    favorite: gr.favorite,
  },
}
export const server = new ApolloServer({
  typeDefs,
  resolvers,
  playground: config.gql_playground,
})
