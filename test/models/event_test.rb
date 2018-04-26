require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new
    assert_not user.valid?
  end

  test 'invalid without name' do
  end

  test 'invalid without email' do
  end
end
