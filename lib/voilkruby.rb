require 'voilkruby/version'
require 'json'
require 'awesome_print' if ENV['USE_AWESOME_PRINT'] == 'true'

module VoilkRuby
  require 'voilkruby/utils'
  require 'voilkruby/type/serializer'
  require 'voilkruby/type/amount'
  require 'voilkruby/type/u_int16'
  require 'voilkruby/type/u_int32'
  require 'voilkruby/type/point_in_time'
  require 'voilkruby/type/permission'
  require 'voilkruby/type/public_key'
  require 'voilkruby/type/beneficiaries'
  require 'voilkruby/type/price'
  require 'voilkruby/type/array'
  require 'voilkruby/type/hash'
  require 'voilkruby/type/future'
  require 'voilkruby/logger'
  require 'voilkruby/chain_config'
  require 'voilkruby/api'
  require 'voilkruby/database_api'
  require 'voilkruby/follow_api'
  require 'voilkruby/tag_api'
  require 'voilkruby/market_history_api'
  require 'voilkruby/network_broadcast_api'
  require 'voilkruby/chain_stats_api'
  require 'voilkruby/account_by_key_api'
  require 'voilkruby/account_history_api'
  require 'voilkruby/condenser_api'
  require 'voilkruby/block_api'
  require 'voilkruby/stream'
  require 'voilkruby/operation_ids'
  require 'voilkruby/operation_types'
  require 'voilkruby/operation'
  require 'voilkruby/transaction'
  require 'voilkruby/base_error'
  require 'voilkruby/error_parser'
  require 'voilkruby/mixins/acts_as_poster'
  require 'voilkruby/mixins/acts_as_voter'
  require 'voilkruby/mixins/acts_as_wallet'
  require 'voilkruby/chain'
  require 'voilk'
  extend self
end
