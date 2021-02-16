require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test 'profile display' do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h3', text: @user.name
    assert_select 'h3>img.gravatar'
    assert_match @user.microposts.count.to_s, response.body
    assert_select 'ul.pagination', count: 1
    @user.microposts.take(10).each do |micropost|
      assert_match micropost.content, response.body
    end
  end
end
