def caesar_cipher(string,shift)
    letters = ('a'..'z').to_a
    return string.split('').reduce('') do |result, char|
        if letters.include?(char.downcase)
            char = letters[(letters.index(char.downcase) + shift) % 26]
            char = char.upcase unless char == char.downcase
        end
        result + char
    end
end

puts caesar_cipher("What a string!", 5)