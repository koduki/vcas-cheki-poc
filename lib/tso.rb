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

  def upload_vci(file)
    response = call_api("/post-items", {
      :itemType => 'prop',
      :file => file
    })
    
    require 'json'
    JSON.load(response.body)
  end

  def upload_pic(file, title, author)
    response = call_api("/post-items/image", {
      :title => title,
      :author => author,
      :version => '',
      :file => file
    })

    require 'json'
    p response
    JSON.load(response.body)
  end
end