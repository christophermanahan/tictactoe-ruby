require "./lib/builder"
require "./lib/writer"
require "./lib/reader"
require "./lib/controller"
require "./lib/board"
require "./lib/player"
require "./lib/players"
require "./lib/player_view"
require "./lib/player_views"
require "./lib/view"
require "mocks/mock_io"

describe "builder" do
	let (:builder) { builder = Builder.new }

	it "Has a build_writer method that returns an instance of Writer" do
		expect(builder.build_writer(MockIO.new)).to be_a(Writer)
	end

	it "Has a build_reader method that returns an instance of Reader" do
		expect(builder.build_reader(MockIO.new)).to be_a(Reader)
	end

	it "Has a build_controller method that returns an instance of Controller" do
		expect(builder.build_controller("test", Writer.new(MockIO.new), Reader.new(MockIO.new))).to be_a(Controller)
	end

	it "Has a build_board method that returns an instance of Board" do
		expect(builder.build_board(3)).to be_a(Board)
	end

	it "Has a build_players method that returns an intance of Players" do
		expect(builder.build_players(2, Player, Controller.new("test", Writer.new(MockIO.new), Reader.new(MockIO.new)), Board.new(3, Cell), 0)).to be_a(Players)
	end

	it "Has a build_player_views method that returns an instance of PlayerViews" do
		expect(builder.build_player_views(PlayerView, ["X"])).to be_a(PlayerViews)
	end

	it "Has a build_view method that returns an instance of view" do
		expect(builder.build_view([], Writer.new(MockIO.new))).to be_a(View)
	end
end
