module Rubybear
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

module Rubybear; class ApiError < BaseError; end; end
module Rubybear; class StreamError < BaseError; end; end
module Rubybear; class TypeError < BaseError; end; end
module Rubybear; class OperationError < BaseError; end; end
module Rubybear; class TransactionError < BaseError; end; end
module Rubybear; class ChainError < BaseError; end; end
