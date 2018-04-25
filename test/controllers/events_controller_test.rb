require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should not save event without parameters" do
    event = Event.new
    assert_not event.save
  end

  # test "redirect user to login page if not signed in" do
    
end
