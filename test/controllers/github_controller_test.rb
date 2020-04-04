require 'test_helper'

class GithubControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_url
    assert_response :success
    assert_equal "index", @controller.action_name
  end

  test 'repository search AJAX request' do
    search_query = 'rails'
    get github_repository_search_url(query: search_query), xhr: true
    assert_not_empty @response.body
    assert_equal 'application/json', @response.media_type
  end
end