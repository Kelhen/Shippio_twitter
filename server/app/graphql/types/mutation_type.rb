Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :createTwitt, function: Resolvers::CreateTwitt.new
  field :createUser, function: Resolvers::CreateUser.new
  field :signinUser, function: Resolvers::SignInUser.new
  # field :validateUser, function: Resolvers::ValidateUser.new
end
