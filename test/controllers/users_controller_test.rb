# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get new signup page' do
    get new_user_path
    assert_response :success
  end
end
