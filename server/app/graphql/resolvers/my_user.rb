class Resolvers::MyUser < GraphQL::Function
  argument :id, !types.String

  # defines inline return type for the mutation
  type do
    field :user, types.String
    field :email, types.String
    field :image, types.String
  end

  type Types::UserType

  def call(_obj, args, _ctx)
    input = args[:id]

    # basic validation
    return unless input

    user = User.find_by id: args[:id]
  end
end
