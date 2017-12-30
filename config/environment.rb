require 'require_all'
require 'active_record'
require 'pry'
require 'open-uri'
require 'nokogiri'
require_all 'lib'

ActiveRecord::Base.establish_connection(
  :adapter  => 'postgresql',
  :database => 'marvel_cards',
  :username => 'marvel',
  :password => 'jjhhuyre123$',
  :host     => 'localhost')
