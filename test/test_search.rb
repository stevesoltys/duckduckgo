require 'test/unit'
require 'duckduckgo'

##
# A test that will search for a phrase and ensure that no exceptions are raised and that the results are valid.
class TestSearch < Test::Unit::TestCase

  ##
  # The phrase that we will be searching for in this test.
  TEST_SEARCH_PHRASE = 'apples'

  ##
  # Tests a regular search, asserting that no exceptions are raised and that the result list is not empty.
  def test_search

    assert_nothing_raised do
      results = DuckDuckGo::search(TEST_SEARCH_PHRASE)

      assert(!results.empty?, "Searching for '#{TEST_SEARCH_PHRASE}' returned zero results.")
    end
  end

end
