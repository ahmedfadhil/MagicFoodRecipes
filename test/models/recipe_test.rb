require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create(chefname: "bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(name: "Checken Curry", summary: "This is an Indian Dish",
                         description: "To cook this you need to have a tast of spicy foods")
  end

  test "recipe should be valid" do
    assert @recipe.valid?
  end

  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end

  test "name should be valid" do
    assert @recipe.name = ""
    assert_not @recipe.valid?
  end

  test "name length should not be too long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end

  test "name length should not be too short" do
    @recipe.name = "aaaa"
    assert_not @recipe.valid?
  end

  test "summer must be present" do
    @recipe.summary = ""
    assert_not @recipe.valid?
  end

  test "summery length should not be too long" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end

  test "summary length should not be too short" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end

  test "description shoud be present " do
    @recipe.description = " "
    assert_not @recipe.valid?
  end

  test "description should not be too long" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end

  test "description should not be too short" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end



end