module VoilkRuby
  module Mixins
    module ActsAsWallet
      # Create a claim_reward_balance operation.
      #
      # Examples:
      #
      #     voilk = VoilkRuby::Chain.new(chain: :voilk, account_name: 'your account name', wif: 'your wif')
      #     voilk.claim_reward_balance(reward_vsd: '100.000 VSD')
      #     voilk.broadcast!
      #
      # @param options [::Hash] options
      # @option options [String] :reward_voilk The amount of VOILK to claim, like: `100.000 VOILK`
      # @option options [String] :reward_vsd The amount of VSD to claim, like: `100.000 VSD`
      # @option options [String] :reward_coins The amount of COINS to claim, like: `100.000000 COINS`
      def claim_reward_balance(options)
        reward_voilk = options[:reward_voilk] || '0.000 VOILK'
        reward_vsd = options[:reward_vsd] || '0.000 VSD'
        reward_coins = options[:reward_coins] || '0.000000 COINS'
        
        @operations << {
          type: :claim_reward_balance,
          account: account_name,
          reward_voilk: reward_voilk,
          reward_vsd: reward_vsd,
          reward_coins: reward_coins
        }
        
        self
      end
      
      # Create a claim_reward_balance operation and broadcasts it right away.
      #
      # Examples:
      #
      #     voilk = VoilkRuby::Chain.new(chain: :voilk, account_name: 'your account name', wif: 'your wif')
      #     voilk.claim_reward_balance!(reward_vsd: '100.000 VSD')
      #
      # @see claim_reward_balance
      def claim_reward_balance!(permlink); claim_reward_balance(permlink).broadcast!(true); end
      
      # Create a transfer operation.
      #
      #     voilk = VoilkRuby::Chain.new(chain: :voilk, account_name: 'your account name', wif: 'your active wif')
      #     voilk.transfer(amount: '1.000 VSD', to: 'account name', memo: 'this is a memo')
      #     voilk.broadcast!
      #
      # @param options [::Hash] options
      # @option options [String] :amount The amount to transfer, like: `100.000 VOILK`
      # @option options [String] :to The account receiving the transfer.
      # @option options [String] :memo ('') The memo for the transfer.
      def transfer(options = {})
        @operations << options.merge(type: :transfer, from: account_name)
        
        self
      end
      
      # Create a transfer operation and broadcasts it right away.
      #
      #     voilk = VoilkRuby::Chain.new(chain: :voilk, account_name: 'your account name', wif: 'your wif')
      #     voilk.transfer!(amount: '1.000 VSD', to: 'account name', memo: 'this is a memo')
      #
      # @see transfer
      def transfer!(options = {}); transfer(options).broadcast!(true); end
    end
  end
end
