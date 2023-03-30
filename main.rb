require_relative 'player.rb'
require_relative "game.rb"

def play_game
	game = Game.new

	puts "What is player one's name?"
	player_one_name = gets.chomp
	puts "Great to meet you #{player_one_name}, you will be 'X's"
	puts "What is player two's name?"
	player_two_name = gets.chomp
	puts "Great to meet you #{player_two_name}, you will be 'O's"

	p1 = Player.new(player_one_name, "X")
	p2 = Player.new(player_two_name, "O")

	game.display_board

	winner = false
	i = 0
	until winner == true
		if i >= 9
			puts "It's a tie!"
			break
		end
		if 	p1.turn
			puts "Its your turn #{p1.name}, what's your move?"
			spot = gets.chomp
			until game.row_one.include?(spot.downcase) || game.row_two.include?(spot.downcase) || game.row_three.include?(spot.downcase)
				puts "Please enter a valid move. (a1, b2, etc.)"
				spot = gets.chomp
			end 
			game.make_move(p1, spot)
			p1.turn = false
			if game.check_for_winner
				puts "Congrats #{p1.name}, you won!"
			end
		elsif p2.turn 
			puts "Its your turn #{p2.name}, what's your move?"
			spot = gets.chomp
			until game.row_one.include?(spot.downcase) || game.row_two.include?(spot.downcase) || game.row_three.include?(spot.downcase)
				puts "Please enter a valid move. (a1, b2, etc.)"
				spot = gets.chomp
			end 
			game.make_move(p2, spot)
			p1.turn = true
			if game.check_for_winner
				puts "Congrats #{p2.name}, you won!"
			end
		end
		winner = game.check_for_winner
		i += 1
	end
end

play_game


