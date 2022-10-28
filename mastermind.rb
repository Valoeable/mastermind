class Game 
    attr_accessor :guesses, :correct_guess

    def initialize(player)
        @guesses = 12
        @correct_guess = false
        @player = player
        play
    end


    def play
        main_p = @player

        randomized_code = 4.times.map { Random.rand(1...6) }

        combination_array = []

        while @correct_guess == false || @guesses>0
            puts("#{main_p.name}, choose your combination wisely:")
            chosen_combination = gets.chomp
            conversion = chosen_combination.split('')
            conversion.each { |number| combination_array << number.to_i }

            combination_check(combination_array, randomized_code)

            @guesses -= 1
        end

        if @correct_guess == true
            puts('Congratulations! You got the secret code correctly!')
        else
            puts('You failed... Better luck next time.')
        end

    end

    def combination_check(array)
        if array == randomized_code
            @correct_guess = true
        else

        end

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
