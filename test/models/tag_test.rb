require "test_helper"

class TagTest < ActiveSupport::TestCase
 test "should save tag" do
  tag = Tag.new(keyword: 'indoor')
  assert tag.save
  end
end
