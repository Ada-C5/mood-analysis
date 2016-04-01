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
end

def overall_mood(text)
moods_array = []
  text.each do |line|
    moods_array << analyze_mood(line)
  end
overall_mood = moods_array.max_by{|mood| moods_array.count(mood)}
return "The most common mood is #{overall_mood}"
end

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
