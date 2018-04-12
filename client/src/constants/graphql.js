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
      name: $name,
      authProvider: {
        email: {
          email: $email,
          password: $password
        }
      }
    ) {
      id
    }

    signinUser(name: {
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
  mutation ValidateUserMutation($name: String!, $name: String!, $validation_token: String!) {
    createUser(
      name: $name,
      validation_token: $validation_token
    ) {
      validate
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
