module DuckDuckGo

  ##
  # This class represents a search result from DuckDuckGo.
  class SearchResult

    ##
    # The URI for this result.
    attr_reader :uri

    ##
    # The title of this result.
    attr_reader :title

    ##
    # The description for this result.
    attr_reader :description

    def initialize(uri, title, description)
      @uri = uri
      @title = title
      @description = description
    end
  end

end