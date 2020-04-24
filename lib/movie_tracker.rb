

module MovieTracker

    class Error < StandardError

    end
end 


require_relative "../config/environment"
require "httparty"
require_relative "./cli"
require_relative "./api"