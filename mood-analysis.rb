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

def strip_punctuation(string)
  string.gsub!(/[^0-9A-Za-z]/, ' ')
end

def happy_days(list_of_moods)
  # how many tweets until there have been 3 happy days?
  number_of_happy_days = 0
  moods_read = 0
  list_of_moods.each do |mood|
    # THANK YOU RUBY KOANS!!!
    break moods_read if number_of_happy_days == 3
    number_of_happy_days += 1 if mood == ":-)"
    moods_read += 1
  end
  if number_of_happy_days >= 3
    return "It takes #{moods_read} entries for 3 happy days to occur"
  else
    return "Only #{number_of_happy_days} happy day(s)...bummer!"
  end
end

def overall_mood(list_of_moods)
  # determines most common mood across all tweets
  # "The most common mood is :-)"

  mood_hash = {
    happy: [],
    sad: [],
    neutral: []
  }

  list_of_moods.each do |mood|
    if mood == ":-)"
      mood_hash[:happy] << mood
    elsif mood == ":-("
      mood_hash[:sad] << mood
    elsif mood == ":-|"
      mood_hash[:neutral] << mood
    end
  end

  max_pair = mood_hash.max_by { |key, value|
    value.length
  }

  "The most common mood is #{max_pair[1][0]}"
end


text = [
  # I considered these to be "tweets" throughout the program
  "03/01 I'm having a terrible horrible no good day.",
  "03/13 Yesterday was horrible, but today is great! Yay!",
  "04/02 Sad Panda. #terribleday",
  "04/15 Hello World, today is fabulous! #yay",
  "05/01 Great! Yay! Good! Yay! Happy. Happy.",
  "05/11 Yay, yay, yay! I'm having a awfuly great day."
]

## the following are not methods because of the scope of the variable "text" above

# printing the date and the mood analysis result
text.each do |tweet|
  puts "#{tweet[1..5]} #{analyze_mood(strip_punctuation(tweet))}"
end

# this variable will be used as happy_days parameter
moods_array = text.map do |tweet|
  analyze_mood(strip_punctuation(tweet))
end

puts happy_days(moods_array)
puts overall_mood(moods_array)
