module Rubybear
  module Type
    class Serializer
      include Rubybear::Utils
      
      def initialize(key, value)
        @key = key
        @value = value
      end
    end
  end
end
