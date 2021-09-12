require 'rest-client'

class Tso
  def initialize(token)
    @url = "https://api.seed.online/files/user"
    @token = token
  end

  def call_api(path, data)
    begin
      ua = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36"
      headers = { 
          'Accept' => 'application/json',
          'Authorization'=> @token,
          'User-Agent' => ua
      }
  
      req = RestClient::Request.new(
        :method => :post,
        :url => @url + path,
        :headers => headers,
        :payload => data
      )
      res = req.execute
  
      return res
    rescue => e
        puts "Error: #{e}"
        return nil
    end
  end

  def upload_icon item_id, src_blob
    require 'rmagick'

    height = 512
    width = 512
    thum_path = "/tmp/thum.png"

    image = Magick::Image.from_blob(src_blob).first
    narrow = image.columns > image.rows ? image.rows : image.columns

    thum = image.crop(Magick::CenterGravity, narrow, narrow).resize(width, height)
    thum.write(thum_path)

    response = call_api("/post-items/#{item_id}/icon", {
      :file => open(thum_path)
    })
    r_icon = JSON.load(response.body)
  end

  def upload_vci(file)
    # upload vci
    file_data = open('/home/koduki/pictures/20210912.png').read
    response = call_api("/post-items", {
      :itemType => 'prop',
      :file => file
    })

    # uplaod icon
    require 'json'
    r = JSON.load(response.body)
    r_icon = upload_icon r['itemId'], file_data

    [r, r_icon]
  end

  def upload_pic(file, title, author)
    # upload image
    file_data = file.read # load for icon
    file.pos = 0          # reset file position
    response = call_api("/post-items/image", {
      :title => title,
      :author => author,
      :version => '',
      :file => file
    })

    # uplaod icon
    require 'json'
    r = JSON.load(response.body)
    r_icon = upload_icon r['itemId'], file_data

    [r, r_icon]
  end
end