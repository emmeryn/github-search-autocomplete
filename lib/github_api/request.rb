class Request
  class << self
    def get(path, query = {})
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