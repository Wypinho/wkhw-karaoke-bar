require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink')
# require_relative('../room')
# require_relative('../guest')

class DrinkTest < Minitest::Test

  def setup()

    @drink1 = Drink.new(5)

  end

  def test_drink_has_price()
    assert_equal(5, @drink1.price)
  end

end
