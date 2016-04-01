FEELINGS = {
  happy: %w(yay good great),
  sad: %w(terrible awful horrible)
}

def analyze_mood(words)
  happy = 0
  sad = 0
  words.downcase!
  # nopunc = words.delete("!.,#")
  nopunc = strip_punctuation(words)
  nopunc.split(" ").each do |word|
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

def strip_punctuation(words)
  words.delete("!.,#")
end


text = [
  "03/01 I'm having a terrible horrible no good day.",
  "03/13 Yesterday was horrible, but today is great! Yay!",
  "04/02 Sad Panda. #terribleday",
  "04/15 Hello World, today is fabulous! #yay",
  "05/01 Great! Yay! Good! Yay! Happy. Happy.",
  "05/11 Yay, yay, yay! I'm having a awfuly great day."
]

def moods(text)
  text.each do |blog|
    face = analyze_mood(blog)
    puts blog[0..5] + face
  end
end

def happy_days(text)
  count = 0
  days = 0
  text.each do |blog|
    face = analyze_mood(blog)
    days += 1
    count += 1 if face == ":-)"
    break if count == 3
  end
    p "It takes #{days} entries for 3 happy days to occur"
end

def overall_mood(text)
  happy_count = 0
  sad_count = 0
  happy = ":-)"
  sad = ":-("
  text.each do |blog|
    face = analyze_mood(blog)
    happy_count += 1 if face == happy
    sad_count += 1 if face == sad
  end

  if happy_count > sad_count
    p "The most common mood is #{happy}"
  elsif sad_count > happy_count
    p "The most common mood is #{sad}"
  else
    p "The most common mood is :-|"
  end
end


moods(text)
happy_days(text)
overall_mood(text)

# puts analyze_mood(text[0])
# puts analyze_mood(text[1])
