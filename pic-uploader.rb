require './lib/tso.rb'

pic_path = Dir.open('/home/koduki/pictures/VirtualCast/Media/').sort[-1]
token = open("#{ENV["HOME"]}/.tsotoken").read.strip
pic = open("/home/koduki/pictures/VirtualCast/Media/#{pic_path}")

puts "Upload: #{pic_path}"
r = Tso.new(token).upload_pic pic
p r

# current_pic = ""
# while(true) do
#     sleep(3)
#     pic_path = Dir.open('/home/koduki/pictures/VirtualCast/Media/').sort[-1]
#     if current_pic != pic_path
#         token = open("#{ENV["HOME"]}/.tsotoken").read.strip
#         pic = open("/home/koduki/pictures/VirtualCast/Media/#{pic_path}")
        
#         puts "Upload: #{pic_path}"
#         r = Tso.new(token).upload_pic pic, "#{pic_path}", 'koduki'
#         p r
#         current_pic = pic_path
#     end
# end