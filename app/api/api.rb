require File.expand_path("../name.rb", __FILE__)
require File.expand_path("../email.rb", __FILE__)
require File.expand_path("../website.rb", __FILE__)

$path = File.join('public', 'db/*.toml')
$array = Dir[$path]

def get_website(path)
  website = false

  if path != false
    IO.foreach(path) do |line|
      if line =~ /website =/
        website = line.gsub(/website =/, '')
      end
    end
  end

  if website != false
    return website
  end

end
