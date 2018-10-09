class Cell
	attr_reader :symbol

	def setMarker(symbol_str)
		@symbol = symbol_str
	end

	def empty?()
		symbol == nil
	end
end
