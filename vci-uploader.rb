require './lib/tso.rb'

vci_path = ARGV[0]
token = open("#{ENV["HOME"]}/.tsotoken").read.strip
vci = open(vci_path)

puts "Upload: #{vci_path}"
tso = Tso.new(token)
r = tso.upload_vci vci
p r
