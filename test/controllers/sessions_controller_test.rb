require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @title = titles(:name)
  end

  test "should get index" do
    get sessions_index_url
    assert_response :success
  end

  test 'should get index when signed in' do
    sign_in users(:one)
    get titles_url
    assert_response :success
  end

  test 'should redirect get when not signed in' do
    get titles_url
    assert_redirected_to new_user_session_url
  end

  test 'should get new when signed in' do
    sign_in users(:one)
    get new_title_url
    assert_response :success
  end

  test 'should redirect new when not signed in' do
    get new_title_url
    assert_redirected_to new_user_session_url
  end

  test 'should not show meeting when signed in' do
    sign_in users(:one)
    get title_url(:en, @title)
    assert_response :error
  end

  test 'should reddirect show meeting when not signed in' do
    get title_url(:en, @title)
    assert_redirected_to new_user_session_url
  end

  test 'should get edit when user signed in' do
    sign_in users(:one)
    get edit_title_url(:en, @title)
    assert_response :success
  end

  test 'should redirect get edit when user not signed in' do
    get edit_title_url(:en, @title)
    assert_redirected_to new_user_session_url
  end
end
