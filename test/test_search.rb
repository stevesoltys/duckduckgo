require 'test/unit'
require 'duckduckgo'

class TestSearch < Test::Unit::TestCase

  TEST_SEARCH_PHRASE = 'apples'

  def test_search

    assert_nothing_raised do
      results = DuckDuckGo::search(TEST_SEARCH_PHRASE)

      assert(!results.empty?, "Searching for '#{TEST_SEARCH_PHRASE}' returned zero results.")
    end

  end

end
