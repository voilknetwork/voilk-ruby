# Voilk chain client for broadcasting common operations.
# 
# @see VoilkRuby::Chain
# @deprecated Using Voilk class provided by VoilkRuby is deprecated.  Please use: VoilkRuby::Chain.new(chain: :voilk)
class Voilk < VoilkRuby::Chain
  def initialize(options = {})
    unless defined? @@deprecated_warning_shown
      warn "[DEPRECATED] Using Voilk class provided by VoilkRuby is deprecated.  Please use: VoilkRuby::Chain.new(chain: :voilk)"
      @@deprecated_warning_shown = true
    end
    
    super(options.merge(chain: :voilk))
  end
  
  alias voilk_per_mcoin base_per_mcoin
  alias voilk_per_usd base_per_debt
end
