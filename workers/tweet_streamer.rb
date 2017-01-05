# frozen_string_literal: true
class TwitterStreamer
  TRACKS = %w(food).freeze

  TweetStream.configure do |config|
    config.consumer_key       = ENV['TW_CONSUMER_KEY']
    config.consumer_secret    = ENV['TW_CONSUMER_SECRET']
    config.oauth_token        = ENV['TW_OAUTH_TOKEN']
    config.oauth_token_secret = ENV['TW_OAUTH_TOKEN_SECRET']
    config.auth_method        = :oauth
  end

  TweetStream::Client.new.track(*TRACKS) do |tweet|
    next if tweet.retweeted?
    photos = tweet.media.select { |medium| medium.is_a?(Twitter::Media::Photo) }
    hashtags = tweet.hashtags.map(&:text)
    if photos.count > 0 && hashtags.count > 0
      params = {
        text: tweet.text,
        url: "https://twitter.com/statuses/#{tweet.id}",
        image_url: photos.first.media_url_https,
        created_at: tweet.created_at,
        hashtags: hashtags
      }
      CreatePostService.call(params)
    end
  end
end
