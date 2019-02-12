module Rubybear
  module Type
    
    # See: https://github.com/xeroc/piston-lib/blob/34a7525cee119ec9b24a99577ede2d54466fca0e/bearsbase/operations.py
    class Amount < Serializer
      def initialize(value)
        super(:amount, value)
        
        case value
        when ::Array
          a, p, t = value
          @asset = case t
          when '@@000000013' then 'BSD'
          when '@@000000021' then 'BEARS'
          when '@@000000037' then 'COINS'
          else; raise TypeError, "Asset #{@asset} unknown."
          end
          @precision = p
          @amount = "%.#{p}f" % (a.to_f / 10 ** p)
        else
          @amount, @asset = value.strip.split(' ')
          @precision = case @asset
          when 'BEARS' then 3
          when 'COINS' then 6
          when 'BSD' then 3
          when 'CORE' then 3
          when 'CESTS' then 6
          when 'TEST' then 3
          else; raise TypeError, "Asset #{@asset} unknown."
          end
        end
      end
      
      def to_bytes
        asset = @asset.ljust(7, "\x00")
        amount = (@amount.to_f * 10 ** @precision).round
        
        [amount].pack('q') +
        [@precision].pack('c') +
        asset
      end
      
      def to_a
        case @asset
        when 'BEARS' then [(@amount.to_f * 1000).to_i.to_s, 3, '@@000000021']
        when 'COINS' then [(@amount.to_f * 1000000).to_i.to_s, 6, '@@000000037']
        when 'BSD' then [(@amount.to_f * 1000).to_i.to_s, 3, '@@000000013']
        else; raise TypeError, "Asset #{@asset} unknown."
        end
      end
      
      def to_s
        "#{@amount} #{@asset}"
      end
    end
  end
end
