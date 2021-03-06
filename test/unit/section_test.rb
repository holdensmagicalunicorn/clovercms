require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  def setup
    Factory.create :section
  end

  test "Name must be present" do
    section = Section.new
    assert section.invalid?, "It should not pass as no title has been defined"
  end

  test "Name must be unique" do
    section = Factory.build(:section)
    assert section.invalid?, "Section invalid as title is already in use."
    section.name = 'Contact'
    assert section.valid?, "Section should pass now."
  end

  test "url_name should be auto generated and unique" do
    section = Factory.create :section, :name => 'New Section'
    assert section.url_name.present?, "Name should be auto generated by the model."
  end
end
