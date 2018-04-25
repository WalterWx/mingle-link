require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should not save event without parameters" do
    event = Event.new
    assert_not event.save
  end

  test "should save event if all parameters are filled" do
    event = Event.new(title: 'Event 1', description: 'Description', 
                      datetime_start: '2018-03-11 14:21:22',
                      datetime_end: '2018-03-12 14:21:22',
                      location: 'Singapore')
    assert event.save
  end
    
end
