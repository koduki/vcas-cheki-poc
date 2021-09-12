require './lib/tso.rb'

cmd = ARGV[0]
pic_dir = "#{Dir.home}/pictures/VirtualCast/Media"

if cmd == 'serve'
    current_pic = ""
    while(true) do
        sleep(3)
        pic_path = Dir.open(pic_dir).sort[-1]
        if current_pic != pic_path
            token = open("#{ENV["HOME"]}/.tsotoken").read.strip
            pic = open("#{pic_dir}/#{pic_path}")
            
            puts "Upload: #{pic_path}"
            r = Tso.new(token).upload_pic pic, "#{pic_path}", 'koduki'
            p r
            current_pic = pic_path
        end
    end
else
    pic_path = Dir.open(pic_dir).sort[-1]
    token = open("#{ENV["HOME"]}/.tsotoken").read.strip
    pic = open("#{pic_dir}/#{pic_path}")

    puts "Upload: #{pic_path}"
    r = Tso.new(token).upload_pic pic, 'test', 'koduki'
    p r
end