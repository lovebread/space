require "fileutils"

# Some paths
src = File.dirname(__FILE__)+"/assets"
dest = File.dirname(__FILE__)+"/../../../public"

filename =  "#{dest}/javascripts/facebox.js"
unless File.exist?(filename)
  FileUtils.cp "#{src}/javascripts/facebox.js", filename
  puts "Copying 'facebox.js'"
end

filename = "#{dest}/stylesheets/facebox.css"
unless File.exist?(filename)
	FileUtils.cp "#{src}/stylesheets/facebox.css", filename
	puts "Copying facebox.css"
end

unless File.exist?("#{dest}/images/facebox")
  FileUtils.mkdir "#{dest}/images/facebox"
  puts "Creating new 'public/images/facebox' directory for facebox"
end

["b.png", "bl.png", "br.png", "tl.png", "tr.png"].each do |image|
	FileUtils.cp "#{src}/images/#{image}", "#{dest}/images/#{image}"
end

puts "facebox done."
