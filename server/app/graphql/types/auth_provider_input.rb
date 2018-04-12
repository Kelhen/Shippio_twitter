Types::AuthProviderInput = GraphQL::InputObjectType.define do
  name 'AUTH_PROVIDER'

  argument :name, !types.String
  argument :password, !types.String
end
