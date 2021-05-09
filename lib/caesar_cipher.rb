class CaesarCipher
  def self.encode(string:, shift:)
    letters = ('a'..'z').to_a
    string.split('').reduce('') do |result, char|
      if letters.include?(char.downcase)
        new_char = letters[(letters.index(char.downcase) + shift) % 26]
        char = char == char.downcase ? new_char : new_char.upcase
      end
      result + char
    end
  end
end
