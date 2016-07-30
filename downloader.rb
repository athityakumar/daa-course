require 'mechanize'
mechanize = Mechanize.new
mechanize.follow_meta_refresh = true 
mechanize.verify_mode = OpenSSL::SSL::VERIFY_NONE
mechanize.pluggable_parser.default = Mechanize::Download 
links = ["BFS","DFS"]
for i in (1..22)
  if i < 10
    links.push("Lecture-0#{i.to_s}")
  else
    links.push("Lecture-#{i.to_s}")
  end
end
Dir.chdir("pdf")
links.each do |link|
  mechanize.get("http://www.facweb.iitkgp.ernet.in/~sourav/#{link}.pdf").save
  puts "Downloaded #{link}.pdf"
end