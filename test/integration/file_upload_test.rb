require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "the truth" do
    visit "/"
    fill_in "Description", with: "test"
    attach_file('File', "#{Rails.root}/test/files/lena.jpg")
    click_on "Save File upload"
    assert page.has_content?('Uploaded file size: 8230'), "File size did not show"
  end
end
