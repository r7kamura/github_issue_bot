$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "github_issuer"
require "chatroid"

Chatroid.new do
  set :service,  "Irc"
  set :server,   ENV["IRC_SERVER"]
  set :port,     ENV["IRC_PORT"]
  set :channel,  ENV["IRC_CHANNEL"]
  set :username, ENV["IRC_USERNAME"]
  set :client,   GithubIssuer.new(
    :user  => ENV["GITHUB_USER"],
    :token => ENV["GITHUB_TOKEN"],
    :repo  => ENV["GITHUB_REPO"]
  )

  on_privmsg do |message|
    case message.body
    when /^list/
      config[:client].all.reverse_each do |issue|
        privmsg config[:channel], ":list: #{issue}"
      end

    when/^#(\d+)/
      issue = config[:client].get($1)
      privmsg config[:channel], ":show: #{issue}"

    when /^create (.+)(?: \[(.+)\])?/
      issue = config[:client].create($1, $2)
      privmsg config[:channel], ":created: #{issue}"

    when /^edit #(\d+) (.+)(?: \[(.+)\])?/
      issue = config[:client].edit($1, $2)
      privmsg config[:channel], ":edited: #{issue}"

    when /^close #(\d+)/
      issue = config[:client].close($1)
      privmsg config[:channel], ":closed: #{issue}"

    when /^help/
      privmsg config[:channel], ":https://github.com/r7kamura/github_issue_bot"
    end
  end
end.run!
