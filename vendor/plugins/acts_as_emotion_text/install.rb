require "fileutils"

# Some paths
src = File.dirname(__FILE__)+"/assets"
dest = File.dirname(__FILE__)+"/../../../public"

filename =  "#{dest}/javascripts/emotion.js"
unless File.exist?(filename)
  FileUtils.cp "#{src}/javascripts/emotion.js", filename
  puts "Copying 'emotion.js'"
end

puts "Installation done."
