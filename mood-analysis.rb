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

text = [
  "03/01 I'm having a terrible horrible no good day.",
  "03/13 Yesterday was horrible, but today is great! Yay!",
  "04/02 Sad Panda. #terribleday",
  "04/15 Hello World, today is fabulous! #yay",
  "05/01 Great! Yay! Good! Yay! Happy. Happy.",
  "05/11 Yay, yay, yay! I'm having a awfuly great day."
]

# puts analyze_mood(text[0])
# puts analyze_mood(text[1])

def string_analysis(array)
  array.each do |day|
    p array[0][0..4] + analyze_mood(day)
  end
end

# string_analysis(text)
# 3. Write a method called `happy_days` to determine how many logged entries it takes until there have been three :-) happy days.
def happy_days(words)
  count =[]
  days = 0
  words.each do |day|
    moods = analyze_mood(day)[-3..-1]
    count << moods.include?(":-)")
      days += 1
    if count.length == 3
      puts "It takes #{days} entries for 3 happy days to occur"
      break
    end
  end
  puts "sorry, to many moods!"
end

# happy_days(text)

# 4. Write a method called `overall_mood` to determine the most common mood across all logged entries.

def overall_mood(words)
  happy = []
  sad = []
  neutral = []

  words.each do |day|
    moods = analyze_mood(day)[-3..-1]
    if moods.include?(":-)")
      happy << moods
    elsif moods.include?(":-(")
      sad << moods
    else
      neutral << moods
    end
  end

    p happy
    p sad
    p neutral

      if happy.length > sad.length && neutral.length
        puts "The most common mood is :-)"
          return happy
      elsif sad.length > happy.length && neutral.length
        puts "The most common mood is :-("
          return sad
      else
        puts "The most common mood is :-|"
          return neutral
      end
end
overall_mood(text)
