require 'logger'

module Rubybear
  # The logger that Rubybear uses for reporting errors.
  #
  # @return [Logger]
  def self.logger
    @@logger ||= Logger.new(STDOUT).tap do |logger|
      logger.progname = 'rubybear'
    end
  end

  # Sets the logger that Rubybear uses for reporting errors.
  #
  # @param logger [Logger] The logger to set as Rubybear's logger.
  # @return [void]
  def self.logger=(logger)
    @@logger = logger
  end
end
