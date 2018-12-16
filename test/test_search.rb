require 'minitest/spec'
require 'minitest/autorun'
require 'duckduckgo'

##
# A test that will search for a phrase and ensure that no exceptions are raised and that the results are valid.
class TestSearch < Minitest::Unit::TestCase

  ##
  # The phrase that we will be searching for in this test.
  TEST_SEARCH_PHRASE = 'apples'

  ##
  # Tests a regular search, asserting that no exceptions are raised and that the result list is not empty.
  def test_search
    results = DuckDuckGo::search(:query => TEST_SEARCH_PHRASE)
    assert(!results.empty?, "Searching for '#{TEST_SEARCH_PHRASE}' returned zero results.")

    # it should be biggenr than 1
    assert_operator(results.length, :>, 1)

    result = results.first
    # it shoul be equal to "https://en.wikipedia.org/wiki/Apple"
    assert_equal(result.uri, "https://en.wikipedia.org/wiki/Apple")
  end

  ##
  # Tests failing of a search that gives a hash with a nil 'query' string.
  def test_nil_search
    assert_raises(RuntimeError) { DuckDuckGo::search(:query => nil) }
  end

  ##
  # Tests failing of a search that gives a hash without the 'query' entry.
  def test_no_query_search
    assert_raises(RuntimeError) { DuckDuckGo::search({:bad => :hash}) }
  end

end
