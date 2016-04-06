require 'nokogiri'
require 'open-uri'
require 'cgi'

##
# The DuckDuckGo module.
module DuckDuckGo

  ##
  # The suffix for the URL that we visit when querying DuckDuckGo.
  RESOURCE_URL = 'https://duckduckgo.com/html/?q='

  ##
  # Searches DuckDuckGo for the given query string. This function returns an array of SearchResults.
  #
  # @param [Hash] hash a hash containing the query string and possibly other configuration settings.
  # @raise [Exception] if there is an error scraping DuckDuckGo for the search results.
  def self.search(hash)

    results = []

    raise 'Hash does not contain a query string.' unless hash.has_key?(:query)
    html = open("#{RESOURCE_URL}#{CGI::escape(hash[:query])}")

    document = Nokogiri::HTML(html)

    document.css('#links').each do |result|
      title_element = result.css('.result__a').first
      raise 'Could not find result link element!' if title_element.nil?

      title = title_element.text
      raise 'Could not find result title!' if title.nil?

      uri = title_element['href']
      raise 'Could not find result URL!' if uri.nil?

      description_element = result.css('.result__snippet').first
      raise 'Could not find result description element!' if description_element.nil?

      description = description_element.text
      raise 'Could not find result description!' if description.nil?

      results << SearchResult.new(uri, title, description)
    end

    return results
  end
end