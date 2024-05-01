#!/usr/bin/env ruby
require 'bunny'

connection = Bunny.new
connection.start

channel = connection.create_channel

queue = channel.queue('epale')

channel.default_exchange.publish('Hola lulitos!', routing_key: queue.name)
puts " [x] Se envió un 'Hola lulitos!'"

connection.close
