require './lib/tso.rb'

cmd = ARGV[0]
pic_dir = "#{Dir.home}/pictures/VirtualCast/Media"
interval = 3

if cmd == 'serve'
    puts "Mode: serve, Inteval: #{interval} sec"
    current_pic = ""
    while(true) do
        sleep(interval)
        pic_latest_name = Dir.open(pic_dir).sort[-1]
        if current_pic != pic_latest_name
            token = open("#{ENV["HOME"]}/.tsotoken").read.strip
            pic = open("#{pic_dir}/#{pic_latest_name}")
            
            puts "Upload: #{pic_latest_name}"
            r = Tso.new(token).upload_pic pic, pic_latest_name, 'koduki'
            p r
            current_pic = pic_latest_name
        end
    end
elsif cmd == nil
    pic_latest_name = Dir.open(pic_dir).sort[-1]
    token = open("#{ENV["HOME"]}/.tsotoken").read.strip
    pic = open("#{pic_dir}/#{pic_latest_name}")

    puts "Upload: #{pic_latest_name}"
    r = Tso.new(token).upload_pic pic, pic_latest_name, 'koduki'
    p r
else
    pic_name = cmd
    token = open("#{ENV["HOME"]}/.tsotoken").read.strip
    pic = open("#{pic_name}")

    puts "Upload: #{pic_name}"
    r = Tso.new(token).upload_pic pic, pic_name, 'koduki'
    p r
end