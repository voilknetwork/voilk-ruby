# Bears chain client for broadcasting common operations.
# 
# @see Rubybear::Chain
# @deprecated Using Bears class provided by Rubybear is deprecated.  Please use: Rubybear::Chain.new(chain: :bears)
class Bears < Rubybear::Chain
  def initialize(options = {})
    unless defined? @@deprecated_warning_shown
      warn "[DEPRECATED] Using Bears class provided by Rubybear is deprecated.  Please use: Rubybear::Chain.new(chain: :bears)"
      @@deprecated_warning_shown = true
    end
    
    super(options.merge(chain: :bears))
  end
  
  alias bears_per_mcoin base_per_mcoin
  alias bears_per_usd base_per_debt
end
