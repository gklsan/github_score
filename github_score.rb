require 'net/http'
require 'json'
require 'pry'

class GithubScore
  URL = 'https://api.github.com/users/dhh/events/public'.freeze
  NAME = 'DHH'.freeze

  attr_accessor :url, :name

  def initialize(url: URL, name: NAME)
    self.url = url
    self.name = name
  end

  def run
    summary = calculate
    total_score = summary.values&.sum
    puts '*' * 40, "#{name}'s github score is #{total_score.to_i}", '*' * 40
    summary.each{|key, value| puts "#{key} => #{value}"}
  end

  private

  def calculate
    api_datas.each_with_object(Hash.new(0)) do |data, result|
      type = data['type'].to_sym
      result[type] += commit_type_and_score(type)
    rescue => e
      puts "#{'$' * 20} Error start", "#{e}", data, "#{'$' * 20} Error end"
      next
    end
  end

  def api_datas
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  rescue => e
    puts "#{'$' * 20} Error start", "Fail to load the url #{url}", "#{'$' * 20} Error end"
    []
  end

  def commit_type_and_score(type)
    {
      IssuesEvent: 7,
      IssueCommentEvent: 6,
      PushEvent: 5,
      PullRequestReviewCommentEvent: 4,
      WatchEvent: 3,
      CreateEvent: 2
    }[type] || 1
  end
end

GithubScore.new.run