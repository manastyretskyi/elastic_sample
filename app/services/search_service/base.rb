module SearchService
  class Base
    attr_reader :term

    def initialize(term)
      @term = term
    end

    def search; end
    
    class << self
      def search(term)
        new(term).search
      end
    end
  end
end