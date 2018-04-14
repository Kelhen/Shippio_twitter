# defines a new GraphQL type
Types::FollowType = GraphQL::ObjectType.define do
  # this type is named `Follow`
  name 'Follow'

  # it has the following fields
  field :user_id, !types.ID
  field :followed_id, !types.ID
  field :action, !types.String
end
