require 'tweetstream'

class Worker
  TweetStream.configure do |config|
    config.consumer_key       = ENV['TW_CONSUMER_KEY']
    config.consumer_secret    = ENV['TW_CONSUMER_SECRET']
    config.oauth_token        = ENV['TW_OAUTH_TOKEN']
    config.oauth_token_secret = ENV['TW_OAUTH_TOKEN_SECRET']
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
