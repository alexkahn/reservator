require "test_helper"

class ReservationTest < ActiveSupport::TestCase
  test 'cannot make a reservation in the past' do
    reservation = reservations(:one)
    reservation.date_time = DateTime.now - 1.minute
    assert !reservation.valid?, "reservation datetime got set in past"
  end
end