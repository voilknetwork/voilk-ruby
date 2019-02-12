module Radiator
  module Type
  
    # See: https://github.com/xeroc/piston-lib/blob/34a7525cee119ec9b24a99577ede2d54466fca0e/bearsbase/operations.py
    class Uint16 < Serializer
      def initialize(value)
        super(:u_int_16, value.to_i)
      end
      
      def to_bytes
        [@value].pack('S')
      end
      
      def to_s
        @value.to_s
      end
    end
  end
end
