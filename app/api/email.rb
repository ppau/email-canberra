def get_email(path)
  email = false

  IO.foreach(path) do |line|
    if line =~ /email =/
      email = line.gsub(/email =/, '')
    end
  end

  if email != false or nil
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

  if output != nil or [] or false
    return output
  end

end

get '/api/email' do
  result = []
  $array.each do |item|
    result.push(get_email(item))
  end
  result.to_json
end

get '/api/email/:input' do
  result = []
  input = params[:input]

  if input =~ /liberal|labour|greens|independant|onenation/
    $array.each do |item|
      # Horrible string is done to stop problems with duplication of output.
      result.push(parse_attribute_e(item, "\"#{input}"))
    end
  end

  if input =~ /federal|statVIC|stateSA|stateWA|stateNSW|stateQLD|stateTAS/
    $array.each do |item|
      output = parse_attribute_e(item, "\"#{input}")
      result.push(output)
    end
  end

  result.to_json
end
