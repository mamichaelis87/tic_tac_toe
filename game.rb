class Game 
	attr_accessor :row_one, :row_two, :row_three

	def initialize
		@row_one = ["a1", "a2", "a3"]
		@row_two = ["b1", "b2", "b3"]
		@row_three = ["c1", "c2", "c3"]
	end

	def display_board
		puts "    1     2     3"
		puts "A #{@row_one}"	
		puts "B #{@row_two}"
		puts "C #{@row_three}"
	end
	
	def make_move(player, move)
		if @row_one.include?(move)
			@row_one[@row_one.index(move)] = player.symbol
		elsif @row_two.include?(move)
			@row_two[@row_two.index(move)] = player.symbol
		elsif @row_three.include?(move)
			@row_three[@row_three.index(move)] = player.symbol
		end
		display_board
	end

	def check_for_winner
		if @row_one[0] == @row_two[0] && @row_one[0] == @row_three[0]
			true
		elsif @row_one[1] == @row_two[1] && @row_one[1] == @row_three[1]
			true
		elsif @row_one[2] == @row_two[2] && @row_one[2] == @row_three[2]
			true
		elsif @row_one[0] == @row_two[1] && @row_one[0] == @row_three[2]
			true
		elsif @row_one[2] == @row_two[1] && @row_one[2] == @row_three[0]
			true
		elsif @row_one.uniq.length == 1
			true
		elsif @row_two.uniq.length == 1
			true
		elsif @row_three.uniq.length == 1
			true
		else 
			false
		end
	end
end
