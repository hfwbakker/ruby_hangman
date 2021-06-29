def generate_word
  array_of_words = File.read("5desk.txt").split()
  array_of_filtered_words = []
  filtered_words = File.readlines("5desk.txt")
  filtered_words.each do |i|
    if i.length >= 5 and i.length <= 12
    array_of_filtered_words.append(i)
    end
  end
  secret_word = array_of_filtered_words[rand(0..array_of_filtered_words.length-1)].delete_suffix("\r\n").split('')
  return secret_word
end

def encode_word(secret_word)
  encoded_word = []
  secret_word.each do |i|
    encoded_word.append("_")
  end
  return encoded_word
end

secret_word = generate_word
encoded_word = encode_word(secret_word)

print("#{secret_word}\n")
print("#{encoded_word}\n")