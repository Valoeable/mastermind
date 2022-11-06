class Game 
    attr_accessor :guesses, :correct_guess, :hint_catcher

    def initialize(player)
        @guesses = 12
        @correct_guess = false
        @player = player
        @hint_catcher = ['X', 'X', 'X', 'X']
        play
    end

    def play
        main_p = @player

        randomized_code = 4.times.map { Random.rand(1...6) }

        combination_array = []

        until @correct_guess || @guesses.zero?

            @hint_catcher.clear
            @hint_catcher = ['X', 'X', 'X', 'X']
            combination_array.clear
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
            puts("You failed... Better luck next time. The code was #{randomized_code}")
        end
    end

    def combination_check(array, randomized_code)
        if array == randomized_code
            @correct_guess = true
        else
            print('Ooops, looks like you got it wrong, here are some hints:')
            array.each_with_index do |color, i|
                exact_once = 0
                same_once = 0
                index = 0
                exact_repair = nil
                until index == 4
                   if (color == randomized_code[index]) && (i != index) && (@hint_catcher[index] != 'E') && (@hint_catcher[index] != 'S') && exact_once.zero? && same_once.zero?
                    @hint_catcher[index] = 'S'
                    same_once = 1 unless array[i + 1] == randomized_code[index]
                    exact_repair = index
                   elsif (color == randomized_code[index]) && (i == index)
                    @hint_catcher[index] = 'E'
                    exact_once = 1
                    exact_check(exact_repair) unless exact_repair.nil?
                   end
                index += 1
                end
            end
            exact = @hint_catcher.count('E')
            same = @hint_catcher.count('S')
            exact.times { print ' ■ ' }
            same.times { print ' □ ' }
            print("\n")
        end    
    end

    def exact_check(repair_index)
            @hint_catcher[repair_index] = 'X'
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
game = Game.new(player_name)
