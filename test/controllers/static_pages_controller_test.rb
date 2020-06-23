# frozen_string_literal: true

require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get start' do
    get static_pages_start_url
    assert_response :success
  end
end
