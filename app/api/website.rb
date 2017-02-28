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
  result = []
  $array.each do |item|
    result.push(get_website(item))
  end
  result.to_json
end

get '/api/website/:input' do
  result = []
  input = params[:input]

  if input =~ /liberal|labour|greens|independant|onenation/
    $array.each do |item|
      # Horrible string is done to stop problems with duplication of output.
      result.push(parse_attribute_w(item, "\"#{input}"))
    end
  end

  if input =~ /federal|statVIC|stateSA|stateWA|stateNSW|stateQLD|stateTAS/
    $array.each do |item|
      # Horrible string is done to stop problems with duplication of output.
      output = parse_attribute_w(item, "\"#{input}")
      result.push(output)
    end
  end

  result.to_json
end
