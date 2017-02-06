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

def parse_attribute_w(path, regular_str)
  output = []

  IO.foreach(path) do |line|
    if line =~ /#{regular_str}/
      output.push(get_website(path))
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

get '/api/website/liberal' do
  result = []
  $array.each do |item|
    output = parse_attribute_w(item, 'party = "liberal"')
    result.push(output)
  end
  result.to_json
end

get '/api/website/labour' do
  result = []
  $array.each do |item|
    output = parse_attribute_w(item, 'party = "labour"')
    result.push(output)
  end
  result.to_json
end

get '/api/website/greens' do
  result = []
  $array.each do |item|
    output = parse_attribute_w(item, 'party = "greens"')
    result.push(output)
  end
  result.to_json
end

get '/api/website/independant' do
  result = []
  $array.each do |item|
    output = parse_attribute_w(item, 'party = "independant"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/federal' do
  result = []
  $array.each do |item|
    output = parse_attribute_w(item, 'level = "federal"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/stateVIC' do
  result = []
  $array.each do |item|
    output = parse_attribute_w(item, 'level = "stateVIC"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/stateNSW' do
  result = []
  $array.each do |item|
    output = parse_attribute_w(item, 'level = "stateNSW"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/stateQLD' do
  result = []
  $array.each do |item|
    output = parse_attribute_w(item, 'level = "stateQLD"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/stateSA' do
  result = []
  $array.each do |item|
    output = parse_attribute_w(item, 'level = "stateSA"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/stateTAS' do
  result = []
  $array.each do |item|
    output = parse_attribute_w(item, 'level = "stateTAS"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/stateWA' do
  result = []
  $array.each do |item|
    output = parse_attribute_w(item, 'level = "stateWA"')
    result.push(output)
  end
  result.to_json
end
