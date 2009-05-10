$:.unshift File.expand_path(File.dirname(__FILE__))

# Ruby standard libraries
%w[socket thread timeout].each do |file|
	require file
end

require 'bunny/client'
require 'bunny/exchange'
require 'bunny/queue'

require 'bunny/protocol/spec'
require 'bunny/protocol/protocol'

require 'bunny/transport/buffer'
require 'bunny/transport/frame'

=begin rdoc

= Bunny: A synchronous Ruby AMQP client

*GitHub* *repo*: http://github.com/celldee/bunny
     
=== DESCRIPTION:

Bunny is an AMQP[http://www.amqp.org] (Advanced Message Queuing Protocol) client, written in Ruby, that is intended to allow you to interact with AMQP-compliant message brokers/servers such as RabbitMQ[http://www.rabbitmq.com] in a synchronous fashion.

It is based on a great deal of useful code from amqp[http://github.com/tmm1/amqp] by Aman Gupta and Carrot[http://github.com/famoseagle/carrot] by Amos Elliston.

You can use Bunny to -

* Create and delete exchanges
* Create and delete queues
* Publish and consume messages

Bunny is known to work with RabbitMQ version 1.5.4 and version 0-8 of the AMQP specification.

=== INSTALL:

*Rubyforge*: <tt>gem install bunny</tt>

*GitHub*: <tt>gem install celldee-bunny</tt>

=== QUICK START:

   require 'bunny'

   b = Bunny::Client.new(:logging => true)

   # start a communication session with the amqp server
   b.start

   # declare a queue
   q = b.queue('test1')

   # publish a message to the queue
   q.publish('Hello everybody!')

   # get message from the queue
   msg = q.pop

   puts 'This is the message: ' + msg + "\n\n"

   # close the connection
   b.stop

=== OTHER:
Please see the _examples_ directory for additional usage information.

=end

module Bunny
	
	include Protocol
	include Transport

	class ProtocolError < StandardError; end
	class ServerDownError < StandardError; end
	class BufferOverflowError < StandardError; end
  class InvalidTypeError < StandardError; end
	class ConnectionError < StandardError; end
	class MessageError < StandardError; end
	
	VERSION = '0.3.0'
	
	# Returns the Bunny version number

	def self.version
		VERSION
	end

end