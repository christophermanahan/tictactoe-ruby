class Writer
	def initialize(io)
		@io = io
	end

	def write(write_message)
		io.puts(write_message)
	end

	private
	attr_reader :io
end
