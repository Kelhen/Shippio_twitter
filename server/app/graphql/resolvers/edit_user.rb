class Resolvers::EditUser < GraphQL::Function
  require 'date'

  argument :user, !types.ID

  AuthProviderInput = GraphQL::InputObjectType.define do
    name 'AuthProviderSignupData'

    argument :email, Types::AuthProviderInput
  end

  argument :name, !types.String
  argument :authProvider, !AuthProviderInput

  type Types::UserType

  def call(_obj, args, _ctx)
    @user = User.update!(
      { name: args[:name] }.reject { |_, v| v.blank? },
      { email: args[:authProvider][:email][:email] }.reject { |_, v| v.blank? },
      { password: args[:authProvider][:email][:password] }.reject { |_, v| v.blank? },
      { updated_at: Time.now },
      { image: 'default_icon.png' }.reject { |_, v| v.blank? }
    )
  rescue ActiveRecord::RecordInvalid => e
    # catch all validation errors and translate them to GraphQL::ExecutionError
    GraphQL::ExecutionError.new("Oups: #{e.record.errors.full_messages.join(', ')}")
    # end
  end

  # return query result here
end
