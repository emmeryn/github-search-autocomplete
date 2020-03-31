class Response
  attr_accessor :status, :body

  def initialize(status:, body:)
    @status = status
    @body = body
  end
end