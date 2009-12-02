module Bowling

  class RollCursor
		def initialize(rolls)
			@idx = 0
			@rolls = rolls
		end

		def roll
			return @rolls[@idx]
		end

		def two_rolls
			return @rolls[@idx] + @rolls[@idx + 1]
		end

		def strike_bonus
			return self.two_rolls_from(@idx + 1)
		end

		def spare_bonus
			return self.roll_at(@idx + 2)
		end

	 	def strike?
			return self.roll == 10
		end

		def spare?
			return self.two_rolls == 10
		end

    def advance(n)
			@idx += n
		end

		def roll_at(index)
			return @rolls[index]
		end

		def two_rolls_from(index)
			return @rolls[index] + @rolls[index + 1]
		end

  end


	class Game
		def initialize
			@rolls = []
		end

		def roll(pins)
			@rolls << pins
		end

		def score
			score = 0
			cur = RollCursor.new(@rolls)
			10.times do
				if cur.strike?
					score += cur.roll
					score += cur.strike_bonus
					cur.advance(1)
				elsif cur.spare?
					score += cur.two_rolls
					score += cur.spare_bonus
					cur.advance(2)
				else
					score += cur.two_rolls
					cur.advance(2)
				end
			end

			return score
		end
	end
end

