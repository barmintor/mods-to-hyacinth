require 'nokogiri'
require 'json'
path = ARGV[1]
HYACINTH = "https://hyacinth.library.columbia.edu/functions#"
class HyacinthFunctions
  def lookup(node, *args)
    assoc = args.each_slice(2).to_h
    auth_or_type = assoc.fetch('authority', assoc['type'])
    dummy = {
      value: node.text.strip,
      uri: "http://example.org/uri-service-lookup/#{assoc['vocabulary_string_key']}/#{auth_or_type}",
    }
    assoc.merge! dummy
    JSON.pretty_generate(assoc)
  end
end

xslt = Nokogiri::XSLT(File.read(ARGV[0]), HYACINTH => HyacinthFunctions)

def apply(xslt, path)
  xml = Nokogiri::XML(File.read(path))
  xslt.apply_to(xml)
end

if File.directory?(path)
  Dir.foreach(path) do |filename|
    next unless filename =~ /[^\.]/
    filepath = File.join(path, filename)
    next if File.directory?(filepath)
    puts apply(xslt, filepath)
  end
else
  puts apply(xslt, path)
end