FEELINGS = {
  happy: %w(yay good great),
  sad: %w(terrible awful horrible)
}

def analyze_mood(words)
  happy = 0
  sad = 0
  words = strip_punctuation(words)
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
  words.gsub(/[^\/A-Za-z0-9\s]/i, "")
end

# "smiley collector": iterate a corpus, analyze its mood, store return in an array.
def print_all_moods(words)
  words.collect { |statement| statement[0..4] + " " + analyze_mood(statement)}
end

def happy_days(words)
  # Write a method called `happy_days` to determine how many logged entries it takes until there have 
  # been three :-) happy days.

  total_days = 0
  hap_days = 0

  words.each do |statement|
    total_days += 1
    if analyze_mood(strip_punctuation(statement)) == ":-)"
      hap_days += 1
    end
    break if hap_days == 3
  end

  "It takes #{total_days} days for 3 happy days to occur."

end

def overall_mood(words)
  feels = {
          happy: [],
          sad: [],
          meh: []
  }

  words.each do |statement|
    if analyze_mood(statement) == ":-)"
      feels[:happy] << ":-)"
    elsif analyze_mood(statement) == ":-("
      feels[:sad] << ":-("
    else
      feels[:meh] << ":-|"
    end
  end

  feels = feels.max_by { |key, value| feels.values.length}
  "The over all mood is #{feels.first.to_s}."

end

puts print_all_moods(text)
puts happy_days(text)
puts overall_mood(text)
