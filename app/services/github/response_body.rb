module Github
  class ResponseBody < Base
    attr_accessor :total_count, :incomplete_results, :items
  end
end
