module VoilkRuby
  module Mixins
    module ActsAsVoter
      # Create a vote operation.
      #
      # Examples:
      #
      #     voilk = VoilkRuby::Chain.new(chain: :voilk, account_name: 'your account name', wif: 'your wif')
      #     voilk.vote(10000, 'author', 'permlink')
      #     voilk.broadcast!
      #
      # ... or ...
      #
      #     voilk = VoilkRuby::Chain.new(chain: :voilk, account_name: 'your account name', wif: 'your wif')
      #     voilk.vote(10000, '@author/permlink')
      #     voilk.broadcast!
      #
      # @param weight [Integer] value between -10000 and 10000.
      # @param args [author, permlink || slug] pass either `author` and `permlink` or string containing both like `@author/permlink`.
      def vote(weight, *args)
        author, permlink = normalize_author_permlink(args)
        
        @operations << {
          type: :vote,
          voter: account_name,
          author: author,
          permlink: permlink,
          weight: weight
        }
        
        self
      end
      
      # Create a vote operation and broadcasts it right away.
      #
      # Examples:
      #
      #     voilk = VoilkRuby::Chain.new(chain: :voilk, account_name: 'your account name', wif: 'your wif')
      #     voilk.vote!(10000, 'author', 'permlink')
      #
      # ... or ...
      #
      #     voilk = VoilkRuby::Chain.new(chain: :voilk, account_name: 'your account name', wif: 'your wif')
      #     voilk.vote!(10000, '@author/permlink')
      #
      # @see vote
      def vote!(weight, *args); vote(weight, *args).broadcast!(true); end
    end
  end
end
