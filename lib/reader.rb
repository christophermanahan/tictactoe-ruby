class Reader
	def initialize(io)
		@io = io
	end

	def read()
		io.gets
	end

	private
	attr_reader :io
end
