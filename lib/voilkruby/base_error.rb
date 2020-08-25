module VoilkRuby
  class BaseError < StandardError
    def initialize(error, cause = nil)
      @error = error
      @cause = cause
    end
    
    def to_s
      if !!@cause
        JSON[error: @error, cause: @cause] rescue {error: @error, cause: @cause}.to_s
      else
        JSON[@error] rescue @error
      end
    end
  end
end

module VoilkRuby; class ApiError < BaseError; end; end
module VoilkRuby; class StreamError < BaseError; end; end
module VoilkRuby; class TypeError < BaseError; end; end
module VoilkRuby; class OperationError < BaseError; end; end
module VoilkRuby; class TransactionError < BaseError; end; end
module VoilkRuby; class ChainError < BaseError; end; end
