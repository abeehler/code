$LOAD_PATH.unshift("automation")

require 'bundler'
Bundler.setup

def delayed
  Configatron::Delayed.new do
    yield
  end
end

def missing(configuration_item_name,file)
  raise "You need to provide a value for #{configuration_item_name} in the file #{file}"
end

def potentially_change(configuration_item_name,file,&block)
  puts "********************You may want to consider changing the value of the setting #{configuration_item_name} in the file #{file}*********************************"
  delayed(&block)
end

def dynamic
  Configatron::Dynamic.new do
    yield
  end
end

require 'initializer'
require 'single'
require 'settings'
require 'chunky_png'
require 'rake'
require 'expansions'
require_relative 'load_settings'
begin
  require 'thor'
rescue StandardError => bang
  print "bad thor"
end

require 'automation'
require 'ostruct'

