FEELINGS = {
  happy: %w(yay good great),      #remove commas??
  sad: %w(terrible awful horrible)
}


def analyze_mood(words)
  happy = 0
  sad = 0
  words.downcase!
  days += 1
  words.split(" ").each do |word|
    if FEELINGS[:happy].include? word
      happy += 1
      if happy == 3
        happy_days
      end
    elsif FEELINGS[:sad].include? word
      sad += 1
    end
  end
  return ":-)" if happy > sad
  return ":-(" if happy < sad
  return ":-|"
end

def strip_punctuation(sentence)
  sentence = sentence.gsub(/[!.,#]/, "")
end


def happy_days
  puts "It took #{days} days to have three happy days"
end

text = [
  "03/01 I'm having a terrible horrible no good day.",
  "03/13 Yesterday was horrible, but today is great! Yay!",
  "04/02 Sad Panda. #terribleday",
  "04/15 Hello World, today is fabulous! #yay",
  "05/01 Great! Yay! Good! Yay! Happy. Happy.",
  "05/11 Yay, yay, yay! I'm having a awfuly great day."
]

text.each do |sentence|
  sentence = strip_punctuation(sentence)
  analyze_mood(sentence)
  sentence_array = sentence.split(" ")
  puts "#{sentence_array[0]} #{analyze_mood(sentence)}"
  happy_days
end
