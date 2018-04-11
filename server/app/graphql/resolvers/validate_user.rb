class Resolvers::ValidateUser < GraphQL::Function
  # arguments passed as "args"
  argument :mail, !types.String
  argument :validation_token, !types.String

  # return type from the mutation
  type Types::UserType

  # the mutation method
  def call(_obj, args, _ctx)
    user = User.find_by email: args[:email], validation_token: args[:validation_token]
    puts user
    # ensures we have the correct user
    return unless user

    User.update!(
      validated: true
    )
  end
end
