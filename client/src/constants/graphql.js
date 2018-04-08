import gql from 'graphql-tag'

export const ALL_TWITT_QUERY = gql`
  query AllTwittQuery {
    allTwitt {
      id
      twitt
      created_at
    }
  }
`
export const CREATE_TWITT_MUTATION = gql`
  mutation CreateTwittMutation($twitt: String!) {
    createTwitt(
      twitt: $twitt,
    ) {
      id
      twitt
      created_at
    }
  }
`
