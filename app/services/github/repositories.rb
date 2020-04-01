module Github
  class Repositories < Base
    include Enumerable

    def initialize(args = {})
      @repositories = parse_repositories(args)
    end

    def each(&block)
      @repositories.each(&block)
    end

    def self.search(keywords)
      endpoint = '/search/repositories'
      response = ::Request.get(endpoint, 'q': keywords)
      if response.status == 200
        response_body = ResponseBody.new(response.body)
        Repositories.new(response_body.items)
      else
        # http request failure
      end
    end

    private

    def parse_repositories(args = [])
      args.map { |repo| Repository.new(repo) }
    end
  end
end