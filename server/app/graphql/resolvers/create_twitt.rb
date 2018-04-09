class Resolvers::CreateTwitt < GraphQL::Function
  require 'date'
  # arguments passed as "args"
  argument :twitt, !types.String

  # return type from the mutation
  type Types::TwittType

  # the mutation method
  def call(_obj, args, ctx)
    Twitt.create!(
      twitt: args[:twitt],
      created_at: DateTime.now,
      user: ctx[:current_user]
    )
  rescue ActiveRecord::RecordInvalid => e
    # this would catch all validation errors and translate them to GraphQL::ExecutionError
    GraphQL::ExecutionError.new("Oups: #{e.record.errors.full_messages.join(', ')}")
  end
end
