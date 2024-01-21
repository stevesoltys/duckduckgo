require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'
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

    raise 'Hash does not contain a query string.' if hash[:query].nil?
    html = URI.open("#{RESOURCE_URL}#{CGI::escape(hash[:query])}")

    document = Nokogiri::HTML(html)

    document.css('.results_links').each do |result|
      title_element = result.css('.result__a').first
      raise 'Could not find result link element!' if title_element.nil?

      title = title_element.text
      raise 'Could not find result title!' if title.nil?

      uri = title_element['href']
      raise 'Could not find result URL!' if uri.nil?

      # Attempt to follow redirects, since DuckDuckGo often aggregates search results from Yahoo.
      begin
        uddg = URI.decode_www_form(uri).to_h["uddg"]
        final_uri = open(uddg, :allow_redirections => :all).base_uri.to_s
      rescue
        final_uri = uri
      end

      description_element = result.css('.result__snippet').first
      raise 'Could not find result description element!' if description_element.nil?

      description = description_element.text
      raise 'Could not find result description!' if description.nil?

      results << SearchResult.new(final_uri, title, description)
    end

    return results
  end
end