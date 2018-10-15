class Reader
	def initialize(io)
		@io = io
	end

	def retrieve_value()
		io.gets
	end

	private
	attr_reader :io
end
