FEELINGS = {
  happy: %w(yay good great),
  sad: %w(terrible awful horrible)
}


def analyze_mood(words)
  happy = 0
  sad = 0
  words.downcase!
  words.split(" ").each do |word|
    word = strip_punctuation(word)
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

# remove ! . , #
def strip_punctuation(words)
  new_word = words.gsub(/[!.,#]/, "")
end


text = [
  "03/01 I'm having a terrible horrible no good day.",
  "03/13 Yesterday was horrible, but today is great! Yay!",
  "04/02 Sad Panda. #terribleday",
  "04/15 Hello World, today is fabulous! #yay",
  "05/01 Great! Yay! Good! Yay! Happy. Happy.",
  "05/11 Yay, yay, yay! I'm having a awfuly great day."
]

sad_text = [
  "03/01 I'm having a terrible horrible no good day.",
  "03/13 Yesterday was horrible, but today is horrible!",
  "04/02 Sad Panda. #terribleday",
  "04/15 Hello World, today is horrible! ",
  "05/01 Great! Yay! Good! Yay! Happy. Happy.",
  "05/11 Yay, yay, yay! I'm having a awfuly great day."
]

def happy_days(entries)
  happy = 0
  no_of_days = 0
    entries.each do |day|
      no_of_days += 1
      mood = analyze_mood(day)
      if mood == ":-)"
        happy += 1
      end
      break if happy == 3
    end
  print "It takes #{no_of_days} days for 3 happy days to occur."
end

def overall_mood(entries)
  happy = []
  sad = []
  no_of_days = 0

  entries.each do |day|
    no_of_days += 1
    mood = analyze_mood(day)
    if mood == ":-)"
      happy << day[0..4]
    else sad << day[0..4]
    end
  end
  if happy.length > sad.length
    puts "The most common mood is happy."
  elsif happy.length == sad.length
    puts "Equal sadness and happiness happened."
  else puts "The most common mood is sad."
  end
end

# testing.
# overall_mood(text)
#
# overall_mood(sad_text)
