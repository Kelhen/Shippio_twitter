class Resolvers::SignInUser < GraphQL::Function
  argument :auth, !Types::AuthProviderInput

  # defines inline return type for the mutation
  type do
    name 'SigninPayload'

    field :token, types.String
    field :user, Types::UserType
  end

  def call(_obj, args, ctx)
    input = args[:auth]

    # basic validation
    return unless input
    user = User.find_by name: input[:name], validated: 'TRUE'

    # ensures we have the correct user
    return unless user
    return unless user.authenticate(input[:password])

    # TODO: add error handling for unmatch user/password and unvalidated user

    # use Ruby on Rails - ActiveSupport::MessageEncryptor, to build a token
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
    token = crypt.encrypt_and_sign("user-id:#{user.id}")

    ctx[:session][:token] = token
    ctx[:session][:user] = user

    OpenStruct.new(
      user: user,
      token: token
    )
  end
end
