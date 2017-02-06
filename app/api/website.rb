require "sinatra"

$path = File.join('public', 'db/*.toml')
$array = Dir[$path]
