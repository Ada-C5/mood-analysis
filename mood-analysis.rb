FEELINGS = {
  happy: %w(yay good great),
  sad: %w(terrible awful horrible)
}

def analyze_mood(words)
  happy = 0
  sad = 0
  words = get_sanitized_input(words)
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

def get_sanitized_input(words)
  # input now matches feelings hash 
  words.downcase!
  # did not write a strip_punctuation method but this line strips it
  words.gsub!(/[^a-z0-9\s]/i, '')
  return words
end 

def get_happy_days(emoji_array)
  happy = 0 
  smile = ":-)"

  number_of_days = 1 
  emoji_array.each do |emoji|
    if emoji == smile
      happy += 1
      if happy >= 3 && happy < 4
        puts "It has taken #{number_of_days} days for #{happy} happy days to occur"
      end
    end
    number_of_days += 1 
  end
  if happy > 3
    puts "There have only been #{happy} happy days out of a total of #{number_of_days-1} days"
  end 
end

def get_overall_mood(emoji_array)
  overall_mood = 0 
  smile = ":-)"
  frown = ":-("
  meh = ":-|"

  emoji_array.each do |emoji|
    if emoji == smile
      overall_mood += 1
    else emoji == frown
      overall_mood -= 1
    end 
  end 
  if overall_mood > 0
    puts "overall mood is #{smile}"
  elsif overall_mood < 0 
    puts "overall mood is #{frown}"
  else 
    puts "overall mood is #{meh}"
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

emoji_array = []

text.each do |day| 
  date = day.split(" ").first
  emoji_array << analyze_mood(day)
  puts date + analyze_mood(day)
end

get_happy_days(emoji_array)
get_overall_mood(emoji_array)




