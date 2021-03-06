class PullRequest  < ActiveRecord::Base
  attr_accessible :title, :issue_url, :body, :state, :merged, :created_at, :repo_name

  EARLIEST_PULL_DATE = Date.parse('01/12/2012').midnight
  LATEST_PULL_DATE   = Date.parse('25/12/2012').midnight

  def self.initialize_from_github(json)
    {
      :title          => json["payload"]["pull_request"]['title'],
      :issue_url      => json["payload"]["pull_request"]['issue_url'],
      :created_at     => json["payload"]["pull_request"]['created_at'],
      :state          => json["payload"]["pull_request"]['state'],
      :body           => json["payload"]["pull_request"]['body'],
      :merged         => json["payload"]["pull_request"]['merged'],
      :repo_name      => json['repo']['name']
    }
  end

end