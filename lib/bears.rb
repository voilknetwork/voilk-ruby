# Bears chain client for broadcasting common operations.
# 
# @see Radiator::Chain
# @deprecated Using Bears class provided by Radiator is deprecated.  Please use: Radiator::Chain.new(chain: :bears)
class Bears < Radiator::Chain
  def initialize(options = {})
    unless defined? @@deprecated_warning_shown
      warn "[DEPRECATED] Using Bears class provided by Radiator is deprecated.  Please use: Radiator::Chain.new(chain: :bears)"
      @@deprecated_warning_shown = true
    end
    
    super(options.merge(chain: :bears))
  end
  
  alias bears_per_mcoin base_per_mcoin
  alias bears_per_usd base_per_debt
end
