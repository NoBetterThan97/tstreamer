require 'tweetstream'

class Worker
  TweetStream.configure do |config|
    config.consumer_key       = 'U1Qmj1XHqLTBmihKxzaGo6TXj'
    config.consumer_secret    = 'FcHaCFqtaSruoozyA7rBXV0SSnObThKpAJmQa3qAwhGW2TkrG3'
    config.oauth_token        = '2179764548-P9vjWJKPyuY9g8kPsKLr1aePrRshN7Pf0L2R8ML'
    config.oauth_token_secret = '3Hjz7IWATv6TXBzRigo2fS4zSeCqAAvBSHb0BwFOfdpl1'
    config.auth_method        = :oauth
  end

  # This will pull a sample of all tweets based on
  # your Twitter account's Streaming API role.
  TweetStream::Client.new.sample do |status|
    # The status object is a special Hash with
    # method access to its keys.
    puts status.text
  end
end
