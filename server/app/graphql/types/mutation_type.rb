Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :createTwitt, function: Resolvers::CreateTwitt.new
end
