class Game 
    attr_accessor :guesses

    def initialize(player)
        @guesses = 12
        @player = player
        play
    end


    def play
        main_p = @player

        randomized_code = 4.times.map { Random.rand(1...6) }

    end

end

class PlayerName
        attr_accessor :name
    
        def initialize
            recieve_name
        end
    
        def recieve_name
            clear
            puts 'Master, select your name:'
            @name = gets.chomp
        end
end

def clear
    print "\e[2J\e[H"
end

player_name = PlayerName.new
game = Game.new(player)
