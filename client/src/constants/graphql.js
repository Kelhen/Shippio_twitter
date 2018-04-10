import gql from 'graphql-tag'

export const ALL_TWITT_QUERY = gql`
  query AllTwittQuery  {
    allTwitt {
      id
      twitt
      created_at
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

  signinUser(email: {
    email: $email,
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
mutation ValidateUserMutation($email: String!, $email: String!, $validation_token: String!) {
  createUser(
    email: $email,
    validation_token: $validation_token
  ) {
    validate
  }
}
`
export const SIGNIN_USER_MUTATION = gql`
  mutation SigninUserMutation($email: String!, $password: String!) {
    signinUser(email: {
      email: $email,
      password: $password
    }) {
      token
      user {
        id
      }
    }
  }
`
