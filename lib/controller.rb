class Controller
	attr_reader :write_message, :writer, :reader

	def initialize(write_message, writer, reader)
		@write_message = write_message
		@writer = writer
		@reader = reader
	end

	def retrieve_value()
		writer.write(write_message)
		reader.read
	end
end
