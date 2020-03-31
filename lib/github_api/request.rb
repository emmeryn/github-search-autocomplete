class Request
  class << self

    # def search_repositories(keywords)
    #   endpoint = '/search/repositories'
    #   get(endpoint, 'q': keywords)
    # end

    def get(path, query = {})
      # query_string = query.map { |k, v| "#{k}=#{v}" }.join('&')
      # path = query.empty? ? root_path : "#{root_path}?#{query_string}"
      response = rest_api.get(path) do |req|
        query.each do |k, v|
          req.params[k] = v
        end
      end

      Response.new(
        status: response.status,
        body: JSON.parse(response.body)
      )
    end

    private

    def rest_api
      Connection.rest_api
    end
  end
end