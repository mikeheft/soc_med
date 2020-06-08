require "soc_med/engine"
require 'blueprinter/base'
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

module SocMed
  mattr_accessor :owner_class

  def self.owner_class
    @@owner_class.to_s.classify.constantize
  end
end
