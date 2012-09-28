class GithubIssuer
  class Issue
    def initialize(response)
      @response = response
    end

    def to_s
      "##{@response["number"]} #{@response["title"]}"
    end
  end
end
