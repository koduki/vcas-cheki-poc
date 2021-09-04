require 'rest-client'

VCI_PATH=ARGV[0]
TOKEN = open("#{ENV["HOME"]}/.tsotoken").read.strip
UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36"

puts "Upload: #{VCI_PATH}"

vci = open(VCI_PATH)
data = ["file", vci, "itemType", "prop"]
headers = { 
    'Accept' => 'application/json',
    'Authorization'=> TOKEN,
    'User-Agent' => UA
}

url="https://api.seed.online/files/user/post-items"
request = RestClient::Request.new(
  :method => :post,
  :url => url,
  :headers => headers,
  :payload => {
    :itemType => 'prop',
    :file => vci
})
response = request.execute

require 'json'
p JSON.load(response.body)