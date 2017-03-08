def get_name(path)
  name = false

  IO.foreach(path) do |line|
    if line =~ /name =/
      name = line.gsub(/name =/, '')
    end
  end

  if name != false or nil
    puts name
    return name
  end
end

def parse_attribute_n(path, regular_str)
  output = []

  IO.foreach(path) do |line|
    if line =~ /#{regular_str}/
      output.push(get_name(path))
    end
  end

  if output != nil or [] or false
    return output
  end

end

get '/api/name' do
  result = []
  $array.each do |item|
    result.push(get_name(item))
  end
  result.to_json
end

get '/api/name/:input' do
  result = []
  input = params[:input]

  if input =~ /liberal|labour|greens|independant|onenation/
    $array.each do |item|
      # Horrible string is done to stop problems with duplication of output.
      result.push(parse_attribute_n(item, "\"#{input}"))
    end
  end

  if input =~ /federal|statVIC|stateSA|stateWA|stateNSW|stateQLD|stateTAS/
    $array.each do |item|
      output = parse_attribute_n(item, "\"#{input}")
      result.push(output)
    end
  end

  result.to_json
end
