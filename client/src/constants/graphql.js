import gql from 'graphql-tag'

export const ALL_TWITT_QUERY = gql`
  query AllTwittQuery {
    allTwitt {
      id
      created_at
      twitt
    }
  }
`
