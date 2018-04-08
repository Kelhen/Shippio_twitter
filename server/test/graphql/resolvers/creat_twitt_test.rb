require 'test_helper'
require 'date'

class Resolvers::CreateTwittTest < ActiveSupport::TestCase
  def perform(**args)
    Resolvers::CreateTwitt.new.call(nil, args)
  end

  test 'success' do

    twitt = perform(
      twitt: 'hello',
      created_at: DateTime.now,
    )

    assert twitt.persisted?
    assert_equal twitt.twitt, 'hello'
  end

  test 'failure' do
    assert perform.is_a? GraphQL::ExecutionError
  end
end
