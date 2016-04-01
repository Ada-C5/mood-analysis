FEELINGS = {
  happy: %w(yay good great),
  sad: %w(terrible awful horrible)
}

def analyze_mood(words)
  happy = 0
  sad = 0
  words.downcase!
  words.split(" ").each do |word|
    if FEELINGS[:happy].include? word
      happy += 1
    elsif FEELINGS[:sad].include? word
      sad += 1
    end
  end
  return ":-)" if happy > sad
  return ":-(" if happy < sad
  return ":-|"
end

text = [
  "03/01 I'm having a terrible horrible no good day.",
  "03/13 Yesterday was horrible, but today is great! Yay!",
  "04/02 Sad Panda. #terribleday",
  "04/15 Hello World, today is fabulous! #yay",
  "05/01 Great! Yay! Good! Yay! Happy. Happy.",
  "05/11 Yay, yay, yay! I'm having a awfuly great day."
]

def strip_punctuation(words)
  # 2. To make the results a little more accurate, let's write and utilize a method called `strip_punctuation` to 
  # strip out the punctuation that affects the results. Namely, remove  exclamation marks (!), periods (.), commas (,), 
  # and hashtags (#).
  words.collect { |statement| statement.gsub(/[^\/A-Za-z0-9\s]/i, "") }
end

text2 = strip_punctuation(text)

# "smiley collector": iterate a corpus, analyze its mood, store return in an array.
def smilies_over_corpus(words)
  words.collect { |statement| statement[0..4] + " " + analyze_mood(statement)}
end

puts smilies_over_corpus(text2)
