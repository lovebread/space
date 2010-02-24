require "fileutils"

# Some paths
src = File.dirname(__FILE__)+"/assets"
dest = File.dirname(__FILE__)+"/../../../public"

filename =  "#{dest}/javascripts/in_place_editor_extension.js"
unless File.exist?(filename)
  FileUtils.cp "#{src}/javascripts/in_place_editor_extension.js", filename
  puts "Copying 'in_place_editor_extension.js'"
end

puts "in_place_editor installation done."
