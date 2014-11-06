require_relative "../lib/team.rb"

describe Team do
	it "has a name" do
		expect(Team.new("hey")).to respond_to :name
	end
	it "has a list of players" do
		expect(Team.new("hey").players).to be_kind_of Array
	end
	it "is favored if it has a celebrity in it" do
		expect(Team.new("hey", ["George Clooney", "Ryan"])).to be_favored
	end
	it "complains if there is a bad word in the name" do
		expect {Team.new("Crappy name") }.to raise_error #need brackets for some reason?
	end

	context "given a bad list of players" do
		let(:bad_players) { {} }

		it "fails to create given a bad player list" do
			expect { Team.new("hey", bad_players)}.to raise_error
		end
	end
end