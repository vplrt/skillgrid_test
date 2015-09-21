module JsonWork
  require 'net/http'
  require 'json'

  class JsonPlaceHolder

    BASE_URL = "http://jsonplaceholder.typicode.com/photos/"

    def initialize(photo_id)
      @photo_id = photo_id
      uri = URI(BASE_URL + @photo_id.to_s)
      response = Net::HTTP.get_response(uri)
      if response.is_a?(Net::HTTPSuccess) && !response.body.empty?
        @data_hash = JSON.parse(response.body)
      else
        raise "Cant get this product."
      end
    end

    def right_color?
      @data_hash['url'].split("/").last.to_i(16) > \
        @data_hash['thumbnailUrl'].split("/").last.to_i(16)
    end

    def get_data_hash
      @data_hash
    end

    def to_s
      @data_hash.to_s
    end

    def get_album_id
      @data_hash['albumId']
    end

    def get_id
      @data_hash['id']
    end

    def get_title
      @data_hash['title']
    end

    def get_url
      @data_hash['url']
    end

    def get_thumbnail_url
      @data_hash['thumbnailUrl']
    end
  end


# begin
# a = JsonPlaceHolder.new(2)
# puts a.get_thumbnail_url
# puts a.to_s
# rescue => e
#   puts "#{e.class}: #{e.message}"
# end
end
