require "soc_med/engine"
require 'soc_med/concerns/likeable'
require 'soc_med/concerns/followable'
require 'soc_med/concerns/blockable'
require 'soc_med/concerns/reportable'
require 'soc_med/services/likes/create'
require 'soc_med/services/likes/destroy'
require 'soc_med/services/follows/create'
require 'soc_med/services/follows/destroy'
require 'soc_med/services/reports/create'
require 'soc_med/services/reports/destroy'
require 'soc_med/services/blocks/create'
require 'soc_med/services/blocks/destroy'
require 'soc_med/configuration'

module SocMed

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration || Configuration.new
    yield(configuration)
  end

end
