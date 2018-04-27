require 'test_helper'
require 'byebug'
class EventsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @event = events(:one)
    @user = users(:valid)
  end

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
    
  test "should not save event if not title" do 
    event = @event
    event.title = ""
    assert_not @event.save
  end

  #test "should save creator in join table when event is created" do 
  #  puts "HELLO"
  #  event = @user.events.create(title: 'Event 1', description: 'Description', 
  #                    datetime_start: '2018-03-11 14:21:22',
  #                    datetime_end: '2018-03-12 14:21:22',
  #                    location: 'Singapore')
  #  event_owner = EventsUser.find_by_event_id(event.id).filter_by_user_id(@user.id)
  #  EventsUser.where('user_id = ' + @user.id.to_s + ' and event_id = ' + @event.id.to_s).update_all(user_role: 'owner')
  #  byebug
  #  assert event_owner
  #end
end
