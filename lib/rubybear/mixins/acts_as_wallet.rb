module Rubybear
  module Mixins
    module ActsAsWallet
      # Create a claim_reward_balance operation.
      #
      # Examples:
      #
      #     bears = Rubybear::Chain.new(chain: :bears, account_name: 'your account name', wif: 'your wif')
      #     bears.claim_reward_balance(reward_bsd: '100.000 BSD')
      #     bears.broadcast!
      #
      # @param options [::Hash] options
      # @option options [String] :reward_bears The amount of BEARS to claim, like: `100.000 BEARS`
      # @option options [String] :reward_bsd The amount of BSD to claim, like: `100.000 BSD`
      # @option options [String] :reward_coins The amount of COINS to claim, like: `100.000000 COINS`
      def claim_reward_balance(options)
        reward_bears = options[:reward_bears] || '0.000 BEARS'
        reward_bsd = options[:reward_bsd] || '0.000 BSD'
        reward_coins = options[:reward_coins] || '0.000000 COINS'
        
        @operations << {
          type: :claim_reward_balance,
          account: account_name,
          reward_bears: reward_bears,
          reward_bsd: reward_bsd,
          reward_coins: reward_coins
        }
        
        self
      end
      
      # Create a claim_reward_balance operation and broadcasts it right away.
      #
      # Examples:
      #
      #     bears = Rubybear::Chain.new(chain: :bears, account_name: 'your account name', wif: 'your wif')
      #     bears.claim_reward_balance!(reward_bsd: '100.000 BSD')
      #
      # @see claim_reward_balance
      def claim_reward_balance!(permlink); claim_reward_balance(permlink).broadcast!(true); end
      
      # Create a transfer operation.
      #
      #     bears = Rubybear::Chain.new(chain: :bears, account_name: 'your account name', wif: 'your active wif')
      #     bears.transfer(amount: '1.000 BSD', to: 'account name', memo: 'this is a memo')
      #     bears.broadcast!
      #
      # @param options [::Hash] options
      # @option options [String] :amount The amount to transfer, like: `100.000 BEARS`
      # @option options [String] :to The account receiving the transfer.
      # @option options [String] :memo ('') The memo for the transfer.
      def transfer(options = {})
        @operations << options.merge(type: :transfer, from: account_name)
        
        self
      end
      
      # Create a transfer operation and broadcasts it right away.
      #
      #     bears = Rubybear::Chain.new(chain: :bears, account_name: 'your account name', wif: 'your wif')
      #     bears.transfer!(amount: '1.000 BSD', to: 'account name', memo: 'this is a memo')
      #
      # @see transfer
      def transfer!(options = {}); transfer(options).broadcast!(true); end
    end
  end
end
