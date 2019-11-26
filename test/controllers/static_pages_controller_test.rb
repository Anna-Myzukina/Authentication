# frozen_string_literal: true

require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get logIn' do
    get login_url
    assert_response :success
  end
end
