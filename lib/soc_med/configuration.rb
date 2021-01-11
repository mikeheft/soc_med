module SocMed
  class Configuration
    attr_accessor :owner_class

    def initialize
      @owner_class = :user
    end

  end
end