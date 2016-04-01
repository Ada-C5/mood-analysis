FEELINGS = {
  happy: ["yay", "good", "great"],
  sad: ["terrible", "awful", "horrible"]
}

def strip_punctuation(words)
  words = words.gsub(/[!.,#]/i, '')
end

def analyze_mood(words)
  happy = 0
  sad = 0
  words.downcase!
  words = strip_punctuation(words)
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

def happy_days(text)
  #text needs to remain in order as an array.
  #analyze_mood called on each line of text.
  smile_count = 0
  day_count = 0
  text.each do |line|
    day_count += 1
    if analyze_mood(line) == ":-)"
      smile_count += 1
    end
    if smile_count == 3
      break
    end
  end
  if smile_count == 3
    return "It took #{day_count} days for happiness to occur."
  else
    return "Sorry, no happy days..."
  end
  #save the return value
  #when return value of :-) = 3, puts index of that line + 1 for number of days.
end
# 3. Write a method called `happy_days` to determine how many logged entries
# it takes until there have been three :-) happy days.
#
# Your output could be something like:
# ```
# It takes 5 entries for 3 happy days to occur
# ```


text = [
  "03/01 I'm having a terrible horrible no good day.",
  "03/13 Yesterday was horrible, but today is great! Yay!",
  "04/02 Sad Panda. #terribleday",
  "04/15 Hello World, today is fabulous! #yay",
  "05/01 Great! Yay! Good! Yay! Happy. Happy.",
  "05/11 Yay, yay, yay! I'm having a awfuly great day."
]

text.each do |line|
  puts line[0..4] + " " + analyze_mood(line)
end
