FEELINGS = {
  happy: %w(yay good great),
  sad: %w(terrible awful horrible)
}
def strip_punctuation(word)
  word_strip = word.gsub(/[^a-z0-9\s]/i, "")
  return word_strip
end

def analyze_mood(words)
  happy = 0
  sad = 0
  words.downcase!
  words.split(" ").each do |word|
    word_s = strip_punctuation(word)
    if FEELINGS[:happy].include? word_s
      happy += 1
    elsif FEELINGS[:sad].include? word_s
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

text.each do |element|
  date = element[0..4]
  smiley = analyze_mood(element)
  puts date + " "+ smiley
end

def happy_days(entries)
  happy_entry = 0
  general_entry = 0
  #keep track of # of happy days and entries for each entry
  entries.map do |entry|
    happy_entry += 1 if analyze_mood(entry) == ":-)"
    general_entry += 1
    break if happy_entry == 3
  end
  #output "it takes 5 entries for 3 happy days to occur"
  if happy_entry < 3
    puts "Sorry, not enough happy days!"
  else
    puts "It takes #{general_entry} entries for 3 happy days to occur."
  end
end

def overall_mood(entries)
  frequency = {
    ":-)" => 0,
    ":-(" => 0,
    ":-|" => 0
  }

  entries.map do |entry|
    mood_instance = analyze_mood(entry)
    frequency[":-)"] += 1 if mood_instance == ":-)"
    frequency[":-("] += 1 if mood_instance == ":-("
    frequency[":-|"] += 1 if mood_instance == ":-|"
  end

  winner = frequency.max_by{|key, value| value}
  puts "The most common mood is #{winner[0]}"
end
happy_days(text)
overall_mood(text)
