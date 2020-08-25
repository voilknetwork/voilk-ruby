require 'logger'

module VoilkRuby
  # The logger that VoilkRuby uses for reporting errors.
  #
  # @return [Logger]
  def self.logger
    @@logger ||= Logger.new(STDOUT).tap do |logger|
      logger.progname = 'voilkruby'
    end
  end

  # Sets the logger that VoilkRuby uses for reporting errors.
  #
  # @param logger [Logger] The logger to set as VoilkRuby's logger.
  # @return [void]
  def self.logger=(logger)
    @@logger = logger
  end
end
