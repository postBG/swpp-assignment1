require 'test_helper'

class UserControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'not actually a test'do
    assert_not false
  end

  test '#signup_success' do
    post :signup, {'username' => 'testuser', 'password' => 'testpass'}
    json = JSON.parse(response.body)
    assert json['username'] == 'testuser'
    assert json['login_count'] == 1
  end
  
  test '#signup_failure_user' do
    post :signup, {'username' => 'test', 'password' => 'testpass'}
    json = JSON.parse(response.body)
    assert json['error_code'] == -1
  end

  test '#signup_failure_pwd' do
    post :signup, {'username' => 'testuser', 'password' => 'test'}
    json = JSON.parse(response.body)
    assert json['error_code'] == -2
  end
  
  test '#login_success' do
    post :login, {'username' => 'Romeo', 'password' => 'ilovejuliet'}
    json = JSON.parse(response.body)
    assert json['username'] == 'Romeo'
    assert json['login_count'] == 2
  end
end
