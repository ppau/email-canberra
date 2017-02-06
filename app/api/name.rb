def get_name(path)
  name = false

  IO.foreach(path) do |line|
    if line =~ /name =/
      name = line.gsub(/name =/, '')
    end
  end

  if name != false
    puts name
    return name
  end
end

# changing parse_for_attribute's name between modules
# fixes bug where modules which call it all get the same output
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

get '/api/name' do
  member_names = []
  $array.each do |item|
    member_names.push(get_name(item))
  end
  member_names.to_json
end

get '/api/name/liberal' do
  result = []
  $array.each do |item|
    output = parse_attribute_n(item, 'party = "liberal"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/labour' do
  result = []
  $array.each do |item|
    output = parse_attribute_n(item, 'party = "labour"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/greens' do
  result = []
  $array.each do |item|
    output = parse_attribute_n(item, 'party = "greens"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/independant' do
  result = []
  $array.each do |item|
    output = parse_attribute_n(item, 'party = "greens"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/federal' do
  result = []
  $array.each do |item|
    output = parse_attribute_n(item, 'level = "federal"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/stateVIC' do
  result = []
  $array.each do |item|
    output = parse_attribute_n(item, 'level = "stateVIC"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/stateNSW' do
  result = []
  $array.each do |item|
    output = parse_attribute_n(item, 'level = "stateNSW"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/stateQLD' do
  result = []
  $array.each do |item|
    output = parse_attribute_n(item, 'level = "stateQLD"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/stateSA' do
  result = []
  $array.each do |item|
    output = parse_attribute_n(item, 'level = "stateSA"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/stateTAS' do
  result = []
  $array.each do |item|
    output = parse_attribute_n(item, 'level = "stateTAS"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/stateWA' do
  result = []
  $array.each do |item|
    output = parse_attribute_n(item, 'level = "stateWA"')
    result.push(output)
  end
  result.to_json
end
