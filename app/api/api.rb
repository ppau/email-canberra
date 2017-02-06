require File.expand_path("../name.rb", __FILE__)
require File.expand_path("../email.rb", __FILE__)
require File.expand_path("../website.rb", __FILE__)

$path = File.join('public', 'db/*.toml')
$array = Dir[$path]
