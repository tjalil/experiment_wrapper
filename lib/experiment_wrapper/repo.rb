require 'faraday'
require 'json'

API_URL = "https://api.github.com/users/tjalil"

module ExperimentWrapper
  class Repo
    attr_reader :id, :login, :location, :public_repos

    def initialize(attributes)
      @id = attributes["id"]
      @login = attributes["login"]
      @location = attributes["location"]
      @public_repos = attributes["public_repos"]
    end

    def self.all
      response = Faraday.get("#{API_URL}/#{username}")
      attributes = JSON.parse(response.body)

      new(attributes)
    end

    def self.repos(username)
      response = Faraday.get("#{API_URL}/#{username}/repos")
      repos = JSON.parse(response.body)

      # new(attributes)
      repos.map { |attributes| new(attributes) }
    end
  end
end