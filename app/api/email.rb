def get_email(path)
  email = false

  IO.foreach(path) do |line|
    if line =~ /email =/
      email = line.gsub(/email =/, '')
    end
  end

  if email != false
    return email
  end
end

def parse_attribute_e(path, regular_str)
  output = []

  IO.foreach(path) do |line|
    if line =~ /#{regular_str}/
      output.push(get_email(path))
    end
  end

  if output != nil or []
    return output
  end

end

get '/api/email' do
  member_emails = []
  $array.each do |item|
    member_emails.push(get_email(item))
  end
  member_emails.to_json
end

get '/api/email/liberal' do
  result = []
  $array.each do |item|
    output = parse_attribute_e(item, 'party = "liberal"')
    result.push(output)
  end
  result.to_json
end

get '/api/email/labour' do
  result = []
  $array.each do |item|
    output = parse_attribute_e(item, 'party = "labour"')
    result.push(output)
  end
  result.to_json
end

get '/api/email/greens' do
  result = []
  $array.each do |item|
    output = parse_attribute_e(item, 'party = "greens"')
    result.push(output)
  end
  result.to_json
end

get '/api/email/independant' do
  result = []
  $array.each do |item|
    output = parse_attribute_e(item, 'party = "independant"')
    result.push(output)
  end
  result.to_json
end

get '/api/email/federal' do
  result = []
  $array.each do |item|
    output = parse_attribute_e(item, 'level = "federal"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/stateVIC' do
  result = []
  $array.each do |item|
    output = parse_attribute_e(item, 'level = "stateVIC"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/stateNSW' do
  result = []
  $array.each do |item|
    output = parse_attribute_e(item, 'level = "stateNSW"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/stateQLD' do
  result = []
  $array.each do |item|
    output = parse_attribute_e(item, 'level = "stateQLD"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/stateSA' do
  result = []
  $array.each do |item|
    output = parse_attribute_e(item, 'level = "stateSA"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/stateTAS' do
  result = []
  $array.each do |item|
    output = parse_attribute_e(item, 'level = "stateTAS"')
    result.push(output)
  end
  result.to_json
end

get '/api/name/stateWA' do
  result = []
  $array.each do |item|
    output = parse_attribute_e(item, 'level = "stateWA"')
    result.push(output)
  end
  result.to_json
end
