# frozen_string_literal: true
class CreatePostService
  def self.call(params, url: ENV['CREATE_POST_URL'])
    HTTParty.post(url,
                  body: params.to_json,
                  headers: { 'Content-Type' => 'application/json' })
    puts "Processed: #{params[:text]}"
  end
end
