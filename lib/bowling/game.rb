module Bowling
	class Game
		def initialize
#			@score = 0
			@rolls = []
		end

		def roll(pins)
#			@score += pins
			@rolls << pins
		end

		def score
#			return @score
			score = 0
			roll_idx = 0
			10.times do
				if @rolls[roll_idx] == 10 # case strike
					score += @rolls[roll_idx] + @rolls[roll_idx + 1] + @rolls[roll_idx + 2]
					roll_idx += 1
				else # case others
					score += @rolls[roll_idx] + @rolls[roll_idx + 1]
					roll_idx += 2
				end
			end
			return score
		end
	end
end

