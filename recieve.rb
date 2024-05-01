#!/usr/bin/env ruby
require 'bunny'

connection = Bunny.new
connection.start

channel = connection.create_channel
queue = channel.queue('epale')

begin
    puts ' [*] Esperando mensajes. Para salir pulsa CTRL+C'
    queue.subscribe(block: true) do |_delivery_info, _properties, body|
      puts " [x] Se recibió un: #{body}"
    end
  rescue Interrupt => _
    connection.close
    exit(0)
  end
