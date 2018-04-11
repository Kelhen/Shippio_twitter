class Resolvers::CreateUser < GraphQL::Function
  require 'securerandom'
  require 'date'

  AuthProviderInput = GraphQL::InputObjectType.define do
    name 'AuthProviderSignupData'

    argument :email, Types::AuthProviderEmailInput
  end

  argument :name, !types.String
  argument :authProvider, !AuthProviderInput

  type Types::UserType

  def call(_obj, args, _ctx)
    @user = User.create!(
      name: args[:name],
      email: args[:authProvider][:email][:email],
      password: args[:authProvider][:email][:password],
      created_at: Time.now,
      validated: 'FALSE',
      validation_token: SecureRandom.urlsafe_base64
    )
    # Sends email to user when user is created.
    # TwittMailer.validation_email(@user).deliver_now if @user.save
  rescue ActiveRecord::RecordInvalid => e
    # catch all validation errors and translate them to GraphQL::ExecutionError
    GraphQL::ExecutionError.new("Oups: #{e.record.errors.full_messages.join(', ')}")
    # end
  end
end
