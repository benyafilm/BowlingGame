class Game

	def initialize
		@rolls=[]
	end

	def roll(pins)
		@rolls << pins
	end

	def score
		score=0
		frame=0
		i=0
		while frame<10
			if frame<9
				if @rolls[i] + @rolls[i+1]==10 #spare
					score += 10 + @rolls[i+2]
					i=i+2
				elsif  @rolls[i]==10 #strike 

					score += 10 + @rolls[i+1] + @rolls[i+2] 
					i=i+1
				else
					score += @rolls[i] + @rolls[i+1] #not spare not strike
					i=i+2
				end
			elsif frame==9
				if @rolls[i]+@rolls[i+1]==10 #spare
					score += 10 + @rolls[i+2]
				elsif @rolls[i]==10 #strike
					score += 10 + @rolls[i+1] + @rolls[i+2]
				else 
					score += @rolls[i] + @rolls[i+1]
				end 
			end
			frame+=1
		end
		score
	end
end