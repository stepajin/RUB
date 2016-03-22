require_relative 'eliza_client'
require 'socket'

cl = ElizaClient.new('localhost', 1096)
puts cl.say 'Hello'
puts cl.say 'HELLO'
puts cl.say 'I have a terrible headache'
puts cl.say 'I have a terrible stomachache'
puts cl.say 'I have a problem'
puts cl.say 'No, not really'
puts cl.say 'My mother always said...'
puts cl.say 'No, not really'
puts cl.say 'Do you have time tomorrow'
