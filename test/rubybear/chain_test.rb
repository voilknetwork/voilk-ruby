require 'test_helper'

module Rubybear
  class ChainTest < Rubybear::Test
    def setup
      options = {
        chain: :bears,
        account_name: 'social',
        wif: '5JrvPrQeBBvCRdjv29iDvkwn3EQYZ9jqfAHzrCyUvfbEbRkrYFC'
      }
      
      @chain = Rubybear::Chain.new(options)
    end
    
    def test_parse_slug
      author, permlink = Rubybear::Chain.parse_slug '@author/permlink'
      
      assert_equal 'author', author
      assert_equal 'permlink', permlink
    end
    
    def test_parse_slug_no_at
      author, permlink = Rubybear::Chain.parse_slug 'author/permlink'
      
      assert_equal 'author', author
      assert_equal 'permlink', permlink
    end
    
    def test_parse_slug_to_comment_with_comments_anchor
      url = 'https://bearshares.com/chainbb-general/@howtostartablog/the-joke-is-always-in-the-comments-8-bsd-contest#comments'
      author, permlink = Rubybear::Chain.parse_slug url
      
      assert_equal 'howtostartablog', author
      assert_equal 'the-joke-is-always-in-the-comments-8-bsd-contest', permlink
    end
    
    def test_parse_slug_to_comment_with_apache_slash
      url = 'https://bearshares.com/chainbb-general/@howtostartablog/the-joke-is-always-in-the-comments-8-bsd-contest/'
      author, permlink = Rubybear::Chain.parse_slug url
      
      assert_equal 'howtostartablog', author
      assert_equal 'the-joke-is-always-in-the-comments-8-bsd-contest', permlink
    end
    
    def test_parse_slug_to_comment
      url = 'https://bearshares.com/chainbb-general/@howtostartablog/the-joke-is-always-in-the-comments-8-bsd-contest#@btcvenom/re-howtostartablog-the-joke-is-always-in-the-comments-8-bsd-contest-20170624t115213474z'
      author, permlink = Rubybear::Chain.parse_slug url
      
      assert_equal 'btcvenom', author
      assert_equal 're-howtostartablog-the-joke-is-always-in-the-comments-8-bsd-contest-20170624t115213474z', permlink
    end
    
    def test_parse_slug_to_comment_no_at
      url = 'btcvenom/re-howtostartablog-the-joke-is-always-in-the-comments-8-bsd-contest-20170624t115213474z'
      author, permlink = Rubybear::Chain.parse_slug url
      
      assert_equal 'btcvenom', author
      assert_equal 're-howtostartablog-the-joke-is-always-in-the-comments-8-bsd-contest-20170624t115213474z', permlink
    end
    
    def test_find_block
      vcr_cassette('find_block') do
        refute_nil @chain.find_block(424377)
      end
    end
    
    def test_find_account
      vcr_cassette('find_account') do
        refute_nil @chain.find_account('ned')
      end
    end
    
    def test_find_comment
      vcr_cassette('find_comment') do
        refute_nil @chain.find_comment('inertia', 'kinda-spooky')
      end
    end
    
    def test_find_comment_with_slug
      vcr_cassette('find_comment') do
        refute_nil @chain.find_comment('@inertia/kinda-spooky')
      end
    end
    
    def test_find_comment_with_slug_and_comments_anchor
      vcr_cassette('find_comment') do
        refute_nil @chain.find_comment('@inertia/kinda-spooky#comments')
      end
    end
    
    def test_properties
      vcr_cassette('properties') do
        refute_nil @chain.properties
      end
    end
    
    def test_block_time
      vcr_cassette('block_time') do
        refute_nil @chain.block_time
      end
    end
    
    def test_base_per_mcoin
      vcr_cassette('base_per_mcoin') do
        refute_nil @chain.base_per_mcoin
      end
    end
    
    def test_base_per_debt
      vcr_cassette('base_per_debt') do
        refute_nil @chain.base_per_debt
      end
    end
    
    def test_followed_by
      vcr_cassette('followed_by') do
        refute_nil @chain.followed_by('inertia')
      end
    end
    
    def test_following
      vcr_cassette('following') do
        refute_nil @chain.following('inertia')
      end
    end
    
    def test_post!
      skip 'Seems like archived post edits are now possible, so we will skip this test to avoid spamming.'
      
      options = {
        title: 'title of my post',
        body: 'body of my post (archive: edited)',
        tags: ['tag'],
        self_upvote: 10000,
        percent_bears_dollars: 0
      }
      
      vcr_cassette('post!') do
        result = @chain.post!(options)
        refute_nil result
        assert_equal ErrorParser, result.class, "expect ErrorParser, got result: #{result}"
        
        # Note: pre-appbase, this was the error:
        # assert_equal '4100000: The comment is archived', result.to_s
        
        # Now, this is what we get:
        assert_equal '10: _callbacks.find( txid ) == _callbacks.end(): Transaction is a duplicate', result.to_s
      end
    end
  end
end
