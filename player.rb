class Player
	attr_reader :name, :symbol 
	attr_accessor :turn

	def initialize(name, symbol)
		@name = name
		@symbol = symbol
		@turn = true
	end
end