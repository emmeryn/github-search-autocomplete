module Github
  class User < Base
    attr_accessor :login,
                  :id,
                  :node_id,
                  :avatar_url,
                  :gravatar_id,
                  :url,
                  :received_events_url,
                  :type
  end
end