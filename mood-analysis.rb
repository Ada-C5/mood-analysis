FEELINGS = {
  happy: %w(yay good great),
  sad: %w(terrible awful horrible)
}

def analyze_mood(words)
  words = strip_punctuation(words)
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
  # return words
  return ":-)" if happy > sad
  return ":-(" if happy < sad
  return ":-|"
end

def strip_punctuation(string_of_words)
  string_of_words.gsub(/[^a-z0-9\s]/i, '')
end

def happy_days(text_array)
  days = 0
  happydays = 0
  text_array.each do |entry|
    result = analyze_mood(entry)
    days += 1
    happydays += 1 if result == ":-)"
    break if happydays == 3
  end
  happydays < 3 ? eval = "Oh no! Out of #{days} days there were #{happydays} happy days." : eval = "It takes #{days} days for 3 happy days to occur."
  puts eval
  happydays
end

def overall_mood(text_array)
  mood = text_array.map { |entry| analyze_mood(entry) }.group_by(&:itself).values.max_by(&:size).last
  puts "The most common mood is #{mood}."
  mood
end

text = [
  "03/01 I'm having a terrible horrible no good day.",
  "03/13 Yesterday was horrible, but today is great! Yay!",
  "04/02 Sad Panda. #terribleday",
  "04/15 Hello World, today is fabulous! #yay",
  "05/01 Great! Yay! Good! Yay! Happy. Happy.",
  "05/11 Yay, yay, yay! I'm having a awfuly great day."
]

text.each do |entry|
  print entry[1..5]
  puts analyze_mood(entry)
end

happy_days(text)
puts happy_days(text)


overall_mood(text)
puts overall_mood(text)
