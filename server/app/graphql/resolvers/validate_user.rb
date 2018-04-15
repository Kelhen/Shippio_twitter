class Resolvers::ValidateUser < GraphQL::Function
  # arguments passed as "args"
  argument :name, !types.String
  argument :token, !types.String

  # return type from the mutation
  type Types::UserType

  # the mutation method
  def call(_obj, args, _ctx)
    user = User.find_by name: args[:name], validation_token: args[:token]
    puts user
    # ensures we have the correct user
    return unless user

    User.update(user.id,
                validated: 'TRUE')
  end
end
