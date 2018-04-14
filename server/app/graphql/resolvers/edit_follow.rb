class Resolvers::EditFollow < GraphQL::Function
  require 'date'
  # arguments passed as "args"
  argument :user_id, !types.ID
  argument :followed_id, !types.ID

  # return type from the mutation
  type Types::FollowType

  # the mutation method
  def call(_obj, args, _ctx)
    # check if the follow is following or not
    follow = Followed.find_by user_id: args[:user_id], followed_id: args[:followed_id]

    # if not creat the follow
    if !follow
      Followed.create!(
        user_id: args[:user_id],
        followed_id: args[:followed_id]
      )
    # if yes, remove the follow
    else
      follow.destroy
    end

    OpenStruct.new(
      user_id: args[:user_id],
      followed_id: args[:followed_id],
      action: follow ? 'unfollow' : 'follow'
    )
  end
rescue ActiveRecord::RecordInvalid => e
  # this would catch all validation errors and translate them to GraphQL::ExecutionError
  GraphQL::ExecutionError.new("Oups: #{e.record.errors.full_messages.join(', ')}")
  puts "Oups: #{e.record.errors.full_messages.join(', ')}"
end
