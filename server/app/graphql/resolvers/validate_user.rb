class Resolvers::ValidateUser < GraphQL::Function
  # arguments passed as "args"
  argument :mail, !types.String
  argument :validation_token, !types.String

  # return type from the mutation
  type Types::UserType

  # the mutation method
  def call(_obj, args, _ctx)
    User.validate!(
      mail: args[:mail],
      validation_token: args[:validation_token]
    )
  end
end
