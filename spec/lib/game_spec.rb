#Benya Vachalathiti 5631271821
require "spec_helper"
require "Game" 

describe Game do
	let (:g) { g = Game .new }

	def roll_many(n,pins)
		n.times  do
			g.roll(pins)			
		end
	end 

	it "give example score (from excel file) " do
		#frame 1
		g.roll(10)
		#frame 2
		g.roll(8)
		g.roll(1)
		#frame 3
		g.roll(2)
		g.roll(8)
		#frame 4
		g.roll(5)
		g.roll(4)
		#frame 5
		g.roll(10)
		#frame 6
		g.roll(10)
		#frame 7
		g.roll(10)
		#frame 8
		g.roll(5)
		g.roll(5)
		#frame 9
		g.roll(10)
		#frame 10
		g.roll(10)
		g.roll(0)
		g.roll(0)
		expect(g.score).to eq(177)
	end

	it "should roll a gutter game" do
		roll_many(20,0)
		expect(g.score).to eq(0)
	end

	it "can roll all ones" do
		roll_many(20,1)
		expect(g.score).to eq(20)
	end

	it "can roll a spare" do
		g.roll(5)
		g.roll(5)
		g.roll(3)
		roll_many(17,0) #spare
		expect(g.score).to eq(16)
	end

	it "can roll a strike" do
		g.roll(10)
		g.roll(5)
		g.roll(3)
		roll_many(17,0)
		expect(g.score).to eq(26)
	end

	it 'can roll a perfect game' do
     roll_many(12, 10)
     expect(g.score).to eq(300)
   end

   it 'can roll a strike at last frame' do
			g3 = Game.new
		    #frame1
		    g3.roll(4)
		    g3.roll(1)
		    #frame2
		    g3.roll(3)
		    g3.roll(2)
		    #frame3
		    g3.roll(4)
		    g3.roll(6) #spare
		    #frame4
		    g3.roll(10) #strike
		    #frame5
		    g3.roll(5)
		    g3.roll(5) #spare
		    #frame6
		    g3.roll(2)
		    g3.roll(8) #spare
		    #frame7
		    g3.roll(2)
		    g3.roll(1)
		    #frame8
		    g3.roll(2)
		    g3.roll(8) #spare
		    #frame9
		    g3.roll(10)	#strike
		    #frame10
		    g3.roll(10) #strike
		    g3.roll(6) 
		    g3.roll(2) #row3
		    expect(g3.score).to eq(141)
	end

	it 'can roll a spare at last frame' do
			g2 = Game.new
		    #frame1
		    g2.roll(5)
		    g2.roll(5) #spare
		    #frame2
		    g2.roll(3)
		    g2.roll(4)
		    #frame3
		    g2.roll(10) #strike
		    #frame4
		    g2.roll(5)
		    g2.roll(3)
		    #frame5
		    g2.roll(7)
		    g2.roll(3) #spare
		    #frame6
		    g2.roll(10) #strike
		    #frame7
		    g2.roll(8)
		    g2.roll(2) #spare
		    #frame8
		    g2.roll(2)
		    g2.roll(2)
		    #frame9
		    g2.roll(4)
		    g2.roll(6) #spare
		    #frame10
		    g2.roll(8)
		    g2.roll(2) #spare
		    g2.roll(5) #row3
		    expect(g2.score).to eq(135)
	end
end
