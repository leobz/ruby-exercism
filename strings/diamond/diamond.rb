module Diamond
    def self.make_diamond(letter)
        string = ""
        letter_indexes = 1..letter_position_in_alphabet(letter)
        line_size = letter_position_in_alphabet(letter) * 2

        letter_indexes.each do |char_index|
            char =  letter_from_position_in_alphabet(char_index)
            string << build_line(char, line_size)
        end

        letter_indexes = 1..letter_position_in_alphabet(letter)-1

        letter_indexes.reverse_each do |char_index|
            char =  letter_from_position_in_alphabet(char_index)
            string << build_line(char, line_size)
        end

        string
    end



    def self.build_line(letter, line_size)
        line = "%#{line_size}s" % ["\n"]

        line[(line_size/2) - letter_position_in_alphabet(letter) ] = letter
        if letter != 'A'
            line[(line_size/2) + letter_position_in_alphabet(letter) - 2] = letter
        end

        line
    end

    def self.letter_position_in_alphabet(char)
        char.ord - 64
    end

    def self.letter_from_position_in_alphabet(integer)
        (integer + 64).chr
    end
end