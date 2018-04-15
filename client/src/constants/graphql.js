import gql from 'graphql-tag'

export const ALL_TWITT_QUERY = gql`
  query AllTwittQuery  {
    allTwitt {
      id
      twitt
      created_at
      postedBy {
        id
        name
        image
      }
    }
  }
`
export const CREATE_TWITT_MUTATION = gql`
  mutation CreateTwittMutation($twitt: String!, $postedById: ID!) {
    createTwitt(
      twitt: $twitt
      postedById: $postedById
    ) {
      id
      twitt
      created_at
      postedBy {
        id
        name
        image
      }
    }
  }
`

export const CREATE_USER_MUTATION = gql`
  mutation CreateUserMutation($name: String!, $email: String!, $password: String!) {
    createUser(
      email: $email,
      authProvider: {
        auth: {
          name: $name,
          password: $password
        }
      }
    ) {
      id
    }

    signinUser(auth: {
      name: $name,
      password: $password
    }) {
      token
      user {
        id
      }
    }
  }
`

export const VALIDATE_USER_MUTATION = gql`
  mutation ValidateUserMutation($name: String!, $token: String!) {
    validateUser(
      name: $name,
      token: $token
    ) {
        id
    }
  }
`
export const SIGNIN_USER_MUTATION = gql`
  mutation SigninUserMutation($name: String!, $password: String!) {
    signinUser(auth: {
      name: $name,
      password: $password
    }) {
      token
      user {
        id
      }
    }
  }
`

export const ALL_USER = gql`
  query allUser {
    allUser{
    id
    name
    email
    image
  }}
`

export const USER_QUERY = gql`
  query UserQuery($id: ID!) {
    myUser(id: $id) {
      id
      name
      email
      image
    }
  }
`

export const EDIT_FOLLOW = gql`
  mutation editFollow($user_id: ID!, $followed_id: ID!) {
    editFollow(user_id: $user_id, followed_id: $followed_id) {
      user_id
      followed_id
      action
    }
  }
`

export const FOLLOWED_USER = gql`
  query followedUser($user_id: ID!) {
    followed(user_id: $user_id){
      followed_id
    }
  }
`

export const FEED_QUERY = gql`
  query FeedQuery($user_id: ID!) {
    feed(user_id: $user_id) {
      id
      twitt
      created_at
      postedBy {
        id
        name
        image
      }
    }
  }
`

export const MY_TWITT_QUERY = gql`
  query MyTwittQuery($user_id: ID!) {
    myTwitt(user_id: $user_id) {
      id
      twitt
      created_at
      postedBy {
        id
        name
        image
      }
    }
  }
`
