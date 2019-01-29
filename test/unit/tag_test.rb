require 'test_helper'

class TagTest < ActiveSupport::TestCase

  test "basics" do
    tag = Tag.first
    assert_not_nil tag.name
    assert_not_nil tag.maps

    tag = Tag.find_by_name 'nice'
    assert_not_nil tag.name
    assert_not_nil tag.maps
  end

end
