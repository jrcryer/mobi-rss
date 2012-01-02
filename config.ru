require 'rubygems'
require 'bundler'
Bundler.setup

require 'sinatra'
require './app'
run MobiRSS::Application