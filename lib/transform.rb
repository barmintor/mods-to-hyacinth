require 'nokogiri'
require 'json'
path = ARGV[1]
HYACINTH = "https://hyacinth.library.columbia.edu/functions#"
class HyacinthFunctions
  def lookup(vocabulary, authority, node)
    uri = {
      uri: "http://example.org/uri-service-lookup/#{vocabulary}/#{authority}",
      authority: authority,
      vocabulary_string_key: vocabulary,
      value: node.text
    }
    JSON.pretty_generate(uri)
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