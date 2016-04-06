module DuckDuckGo

  class SearchResult

    attr_reader :uri, :title, :description

    def initialize(uri, title, description)
      @uri = uri
      @title = title
      @description = description
    end
  end

end