require 'application_system_test_case'

class SearchFlowTest < ApplicationSystemTestCase
  test 'can see the main page' do
    visit root_url
    assert_selector 'h1', text: 'GitHub Search Autocomplete PoC'
  end

  test 'suggestions dropdown' do
    visit root_url

    # before typing search term, there should be no suggestions
    assert_selector 'div.tt-dataset', visible: false do
      assert_selector 'div.tt-suggestion', count: 0
    end

    search_query = 'rails'
    fill_in 'search_textbox', with: search_query
    sleep 5.seconds # wait for results to load

    # after typing search term, there should at least be 1 suggestion
    assert_selector 'div.tt-dataset', visible: false do
      assert_selector 'div.tt-suggestion', minimum: 1
    end
  end

end
