class Resolvers::CreateTwitt < GraphQL::Function
  require 'date'
  # arguments passed as "args"
  argument :twitt, !types.String
  argument :postedById, !types.ID

  # return type from the mutation
  type Types::TwittType

  # the mutation method
  def call(_obj, args, ctx)
    puts ctx

    # ugly tempory fix no access to data in  ctx ? or data are wrong
    # should be ctx[:session][:user]
    # TODO change it
    user = User.find_by id: args[:postedById]
    puts user
    # ensures we have the correct user
    return unless user

    Twitt.create!(
      twitt: args[:twitt],
      created_at: DateTime.now,
      # user: ctx[:current_user]
      user: user
      # user: args[:postedById]
    )
  end
rescue ActiveRecord::RecordInvalid => e
  # this would catch all validation errors and translate them to GraphQL::ExecutionError
  GraphQL::ExecutionError.new("Oups: #{e.record.errors.full_messages.join(', ')}")
  puts "Oups: #{e.record.errors.full_messages.join(', ')}"
end
