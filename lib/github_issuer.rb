require "github_api"
require "github_issuer/issue"

class GithubIssuer
  def initialize(config)
    @token    = config[:token]
    @repo     = config[:repo]
    @user     = config[:user]
    @client   = Github.new(:oauth_token => @token).issues
  end

  def all
    @client.list_repo(@user, @repo).map do |res|
      Issue.new(res)
    end
  end

  def create(title, asignee = nil)
    res = @client.create(@user, @repo, :title => title, :asignee => asignee)
    Issue.new(res)
  end

  def edit(number, title, asignee = nil)
    res = @client.edit(@user, @repo, number, :title => title, :asignee => asignee)
    Issue.new(res)
  end

  def get(number)
    res = @client.get(@user, @repo, number)
    Issue.new(res)
  end

  def close(number)
    res = @client.edit(@user, @repo, number, :state => "closed")
    Issue.new(res)
  end

  def open(number)
    res = @client.edit(@user, @repo, number, :state => "open")
    Issue.new(res)
  end
end
