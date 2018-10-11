class PlayerViews
	def initialize(player_view, symbols)
		@all = Array.new(symbols.length).each_with_index.map { |_, i| player_view.new(symbols[i]) }
	end

	def get_player_view(player_number)
		all[player_number]
	end

	private
	attr_reader :all
end
