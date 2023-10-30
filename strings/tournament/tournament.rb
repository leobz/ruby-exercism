class Tournament
    HEADER = "Team                           | MP |  W |  D |  L |  P\n"

    def self.tally(input)
        # Initialize table
        table = String.new(HEADER)

        # Initialize Hash keys automatically
        scores = Hash.new {|hash,key| hash[key] = {mp: 0, w: 0, d: 0, l:0}}
        
        input.each_line do |line|
            team1, team2, result = line.strip.split(';')

            [team1, team2].each {|t| scores[t][:mp] += 1 }

            case result
            when "win"
                scores[team1][:w] += 1
                scores[team2][:l] += 1
            when "draw"
                scores[team1][:d] += 1
                scores[team2][:d] += 1
            when "loss"
                scores[team1][:l] += 1
                scores[team2][:w] += 1
            end
        end

        scores = scores.sort_by {|team, score| [- sum_points(score), team]}
        scores.each {|team, scores| table << self.build_line(team, scores) }

        table
    end

    def self.build_line(team, score)
        if team
            points = sum_points(score)
            "%-31s|  #{score[:mp]} |  #{score[:w]} |  #{score[:d]} |  #{score[:l]} |%3s\n" % [team, points]
        else
            ""
        end
    end

    def self.sum_points(score)
        score[:w] * 3 + score[:d]
    end
end