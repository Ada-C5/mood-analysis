FEELINGS = {
  happy: %w(yay good great),
  sad: %w(terrible awful horrible)
}

# analyze string to see if it's happy/sad/neutral
def analyze_mood(words)
  happy = 0
  sad = 0
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

# strip punctuation out of string
def strip_punctuation(words)
  words.downcase.gsub(/[^a-z ]/, '')
end

text = [
  "03/01 I'm having a terrible horrible no good day.",
  "03/13 Yesterday was horrible, but today is great! Yay!",
  "04/02 Sad Panda. #terribleday",
  "04/15 Hello World, today is fabulous! #yay",
  "05/01 Great! Yay! Good! Yay! Happy. Happy.",
  "05/11 Yay, yay, yay! I'm having a awfuly great day."
]

# print out date + mood by calling analyze mood
def week_moods(array)
  array.each do |day|
    date = day[0..4]
    puts "#{date} #{analyze_mood(day)}"
  end
end

def happy_days(array)
  happy = 0
  days = 0
  array.each do |day|
    mood = analyze_mood(day)[-3..-1]
    if mood == ":-)"
      happy += 1
    end
    days += 1
    if happy == 3
      break
    end
  end  
  if happy == 3
    puts "It takes #{days} entries for 3 happy days to occur"
  else
    puts "You are having quite a bad week."
  end
end

# returns most common mood
def overall_mood(array)
  mood_array = []
  happy = 0
  sad = 0
  neutral = 0
  array.each do |day|
    mood = analyze_mood(day)
    mood_array << mood
  end
  mood_array.each do |mood|
    happy += 1 if mood == ":-)"
    sad += 1 if mood == ":-("
    neutral += 1 if mood == ":-|"
  end
  if happy == [happy, sad, neutral].max
    puts "The most common mood is :-)"
  elsif sad == [happy, sad, neutral].max
    puts "The most common mood is :-("
  else
    puts "The most common mood is :-|"
  end
end


# call methods
overall_mood(text)
# happy_days(text)
# week_moods(text)
# puts analyze_mood(text[0])
# puts analyze_mood(text[1])