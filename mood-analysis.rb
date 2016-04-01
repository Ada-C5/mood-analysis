FEELINGS = {
  happy: %w(yay good great),
  sad: %w(terrible awful horrible)
}

happy_days = 0

def analyze_mood(words)
  happy = 0
  sad = 0
  strip_punctuation(words.downcase!)
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

def strip_punctuation(word)
  word.gsub!(/[!.,#]/, "") unless word.nil?
end


def happy_days(text)
  days = 0
  index = analyze_text(text).each_with_index do |mood, i|
    days += 1 if mood.include? ":-)"
    break i if days == 3
  end

  return "There aren't 3 happy days!" if days < 3
  "It takes #{index} entries for 3 happy days to occur."
end

def analyze_text(text)
  text.map do |entry|
    "#{entry[0,5]} " + analyze_mood(entry)
  end
end

def overall_mood(text)
  mood_count = Hash.new { |hash, key| hash[key] = 0 }

  analyze_text(text).each do |mood|
    mood_count[mood[-3, 3]] += 1
  end

  highest_mood = mood_count.max_by { |k, v| v }
  "The most common mood is #{highest_mood[0]}"
end

text = [
  "03/01 I'm having a terrible horrible no good day.",
  "03/13 Yesterday was horrible, but today is great! Yay!",
  "04/02 Sad Panda. #terribleday",
  "04/15 Hello World, today is fabulous! #yay",
  "05/01 Great! Yay! Good! Yay! Happy. Happy.",
  "05/11 Yay, yay, yay! I'm having a awfuly great day."
]

puts analyze_text(text)
puts happy_days(text)
puts overall_mood(text)
