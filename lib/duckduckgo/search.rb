require 'nokogiri'
require 'open-uri'
require 'cgi'

module DuckDuckGo

  RESOURCE_URL = 'https://duckduckgo.com/html/?q='

  def self.search(query)
    results = []

    html = open("#{RESOURCE_URL}#{CGI::escape(query)}")

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