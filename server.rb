require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'haml'
set :bind, '0.0.0.0'

KNOW_TYPES=%w(png jpg jpeg)

get '/' do
  @images = KNOW_TYPES.map {|t| Dir.glob("./public/images/*.#{t}") }.flatten.
    map { |i| i.gsub 'public/', '' }
  haml :index, :format => :html5
end
