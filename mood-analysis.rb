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
  words.collect! { |statement| statement.gsub(/[^\/A-Za-z0-9\s]/i, "") }
end

# "smiley collector": iterate a corpus, analyze its mood, store return in an array.
def print_all_moods(words)
  strip_punctuation(words)
  words.collect { |statement| statement[0..4] + " " + analyze_mood(statement)}
end

def happy_days(words)
  # Write a method called `happy_days` to determine how many logged entries it takes until there have 
  # been three :-) happy days.
  all_moods = words.collect { |statement| analyze_mood(statement)}
  return "3 happy days were not achieved in this collection." if all_moods.count { |mood| mood == ":-)" } < 3


  day_count = 0
  smiley_count = 0
  
  all_moods.length.times do |i|
    if smiley_count < 3  
      if all_moods[i] == ":-)"
        smiley_count += 1
      end
    day_count += 1
    else
      break
    end
    return "It took #{day_count} days for 3 happy days to occur."
  end


end



puts print_all_moods(text)
puts happy_days(text)
