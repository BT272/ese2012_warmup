require "test/unit"
require "../app/user"

class UserTest < Test::Unit::TestCase

  def test_constructor
    user = User.named("Lollys")
    assert_equal(user.name, "Lollys")
    assert_equal(user.credits, 100)
    assert_equal(user.items.size, 0)
  end



end