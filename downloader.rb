require 'mechanize'
mechanize = Mechanize.new
mechanize.follow_meta_refresh = true 
mechanize.verify_mode = OpenSSL::SSL::VERIFY_NONE
mechanize.pluggable_parser.default = Mechanize::Download 
links = ["BFS","DFS"]
unless Dir.exist? "pdf"
  Dir.mkdir("pdf") 
end
Dir.chdir("pdf")
existing_files = Dir.entries(".")
existing_files.delete(".")
existing_files.delete("..")
for i in (1..22)
  if i < 10
    links.push("Lecture-0#{i.to_s}")
  else
    links.push("Lecture-#{i.to_s}")
  end
end
links.each do |link|
  if existing_files.include? link+".pdf"
    puts "#{link}.pdf already exists"
  else
    mechanize.get("http://www.facweb.iitkgp.ernet.in/~sourav/#{link}.pdf").save
    puts "Downloaded #{link}.pdf"
  end
end