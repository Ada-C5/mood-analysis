FEELINGS = {
  happy: %w(yay good great),
  sad: %w(terrible awful horrible)
}

def strip_punctuation(words)
  words.gsub(/[!.,#]/, '')
end

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

def happy_days(words)
  entries = 0
  happy = 0
  strip = []

  words.each do |word|
    strip << strip_punctuation(word)
  end

  strip.each do |string|
    if happy < 3
      entries += 1
      if analyze_mood(string) == ":-)"
        happy += 1
      end
    elsif happy == 3
      puts "It takes #{entries} entries for 3 happy days to occur."
    else
      puts "There were less than 3 happy days in #{entries} entries. :-("
    end
  end
end

def overall_mood(words)
  happy = 0
  sad = 0
  neutral = 0
  strip = []

  words.each do |word|
    strip << strip_punctuation(word)
  end

  strip.each do |string|
    if analyze_mood(string) == ":-)"
      happy += 1
    elsif analyze_mood(string) == ":-("
      sad += 1
    elsif analyze_mood(string) == ":-|"
      neutral +=0
    end
  end

  if happy > (sad && neutral)
    puts "The most common mood is :-)"
  elsif sad > (happy && neutral)
    puts "The most common mood is :-("
  elsif neutral > (sad && happy)
    puts "The most common mood is :-|"
  else
    puts "The most common mood is unable to be determined."
  end
end

text = [
  "03/01 I'm having a terrible horrible no good day.",
  "03/13 Yesterday was horrible, but today is great! Yay!",
  "04/02 Sad Panda. #terribleday",
  "04/15 Hello World, today is fabulous! #yay",
  "05/01 Great! Yay! Good! Yay! Happy. Happy.",
  "05/11 Yay, yay, yay! I'm having a awfuly great day."
]

stripped = []

text.each do |string|
  stripped << strip_punctuation(string)
end

stripped.each do |string|
puts string[0..5] + analyze_mood(string)
end

happy_days(text)

overall_mood(text)
