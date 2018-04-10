class GraphqlController < ApplicationController
  def execute
    result = ServerSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?
    handle_error_in_development e
  end

  private

  def query
    params[:query]
  end

  def variables
    ensure_hash params[:variables]
  end

  def operation_name
    params[:operationName]
  end

  def context
    {
      session: session,
      current_user: current_user
    }
  end

  # gets current user from token stored in session
  def current_user
    # if we want to change the sign-in strategy, this is the place todo it
    return unless session[:token]

    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
    token = crypt.decrypt_and_verify session[:token]
    user_id = token.gsub('user-id:', '').to_i
    User.find_by id: user_id
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    nil
  end

  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { error: { message: e.message, backtrace: e.backtrace }, data: {} }, status: 500
  end
end

# class GraphqlController < ApplicationController
#   def execute
#     variables = ensure_hash(params[:variables])
#     query = params[:query]
#     operation_name = params[:operationName]
#     context = {
#       session: session,
#       current_user: current_user
#     }
#     result = ServerSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
#     render json: result
#   end
#
#   private
#
#   # gets current user from token stored in session
#   def current_user
#     # if we want to change the sign-in strategy, this is the place todo it
#     return unless session[:token]
#
#     crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
#     token = crypt.decrypt_and_verify session[:token]
#     user_id = token.gsub('user-id:', '').to_i
#     User.find_by id: user_id
#   rescue ActiveSupport::MessageVerifier::InvalidSignature
#     nil
#   end
#
#   # Handle form data, JSON body, or a blank value
#   def ensure_hash(ambiguous_param)
#     case ambiguous_param
#     when String
#       if ambiguous_param.present?
#         ensure_hash(JSON.parse(ambiguous_param))
#       else
#         {}
#       end
#     when Hash, ActionController::Parameters
#       ambiguous_param
#     when nil
#       {}
#     else
#       raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
#     end
#   end
# end