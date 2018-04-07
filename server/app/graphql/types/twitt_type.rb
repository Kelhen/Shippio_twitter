# defines a new GraphQL type
Types::TwittType = GraphQL::ObjectType.define do
  # this type is named `Twitt`
  name 'Twitt'

  # it has the following fields
  field :id, !types.ID
  field :twitt, !types.String
  field :created_at, !types.Int
end
