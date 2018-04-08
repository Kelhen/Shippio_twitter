class Resolvers::CreateTwitt < GraphQL::Function
  require 'date'
  # arguments passed as "args"
  argument :twitt, !types.String

  # return type from the mutation
  type Types::TwittType

  # the mutation method
  def call(_obj, args, _ctx)
    Twitt.create!(
      twitt: args[:twitt],
      created_at: DateTime.now,
    )
  end
end
