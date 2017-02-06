require "sinatra"

$path = File.join('public', 'db/*.toml')
$array = Dir[$path]

def get_website(path)
  website = false

  IO.foreach(path) do |line|
    if line =~ /website =/
      website = line.gsub(/website =/, '')
    end
  end

  if website != false
    return website
  end
end

def parse_attribute_n(path, regular_str)
  output = []

  IO.foreach(path) do |line|
    if line =~ /#{regular_str}/
      output.push(get_name(path))
    end
  end

  if output != nil or []
    return output
  end

end

get '/api/website' do
  member_websites = []
  $array.each do |item|
    member_websites.push(get_website(item))
  end
  member_websites.to_json
end
