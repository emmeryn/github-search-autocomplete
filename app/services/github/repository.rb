module Github
  class Repository < Base
    attr_accessor :id,
                  :node_id,
                  :name,
                  :full_name,
                  :owner,
                  :private,
                  :html_url,
                  :description,
                  :fork,
                  :url,
                  :created_at,
                  :updated_at,
                  :pushed_at,
                  :homepage,
                  :size,
                  :stargazers_count,
                  :watchers_count,
                  :language,
                  :forks_count,
                  :open_issues_count,
                  :master_branch,
                  :default_branch,
                  :score

    def initialize(args = {})
      super(args)
      self.owner = parse_owner(args)
    end

    private

    def parse_owner(args = {})
      Github::User.new args['owner']
    end
  end
end