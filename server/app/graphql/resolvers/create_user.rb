class Resolvers::CreateUser < GraphQL::Function
  require 'securerandom'
  require 'date'

  AuthProviderInput = GraphQL::InputObjectType.define do
    name 'AuthProviderSignupData'

    argument :auth, Types::AuthProviderInput
  end

  argument :email, !types.String
  argument :authProvider, !AuthProviderInput

  type Types::UserType

  def call(_obj, args, _ctx)
    @user = User.create!(
      email: args[:email],
      name: args[:authProvider][:auth][:name],
      password: args[:authProvider][:auth][:password],
      created_at: Time.now,
      validated: 'FALSE',
      validation_token: SecureRandom.urlsafe_base64,
      image: 'default_icon.png'
    )
  rescue ActiveRecord::RecordInvalid => e
    # catch all validation errors and translate them to GraphQL::ExecutionError
    GraphQL::ExecutionError.new("Oups: #{e.record.errors.full_messages.join(', ')}")
    # end
  end

  # return query result here
end
