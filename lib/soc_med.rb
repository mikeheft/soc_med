require "soc_med/engine"

module SocMed
  mattr_accessor :owner_class

  def self.owner_class
    @@owner_class.to_s.classify.constantize
  end
end
