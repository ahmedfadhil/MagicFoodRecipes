require 'test_helper'

class ChefTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.new(chefname: "John", email: "john@example.com")
  end

  test "cehf should be valide" do
    assert @chef.valid?
  end
  test "chefname must be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end
  test "chefname should not be too short" do
    @chef.chefname = "aa"
    assert_not @chef.valid?
  end

  test "chefname should not be too  long" do
    @chef.chefname = "a" * 41
    assert_not @chef.valid?
  end


  test "email must be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end


  test "email length should be within bounds" do
    @chef.chefname = "a" * 101 + "@example.com"
    assert_not @chef.valid?
  end
  test "email address should be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@eee.com R_TDD@eee.hello.org user@example.com first.last@something.au laurea+joe@monk.com]
    valid_addresses.each do |val|
      @chef.email = val
      assert @chef.valid?, '#{val.inspect} should be valid'
    end

  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_ee.org user.name@example. eee@i_am_.com fpp@333+aar.com]
    invalid_addresses.each do |inval|
      @chef.email = inval
      assert_not @chef.valid?, '#{inval.inspect} should be invalid'
    end
  end

end

