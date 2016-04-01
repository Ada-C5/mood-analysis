FEELINGS = {
  happy: %w(yay good great),
  sad: %w(terrible awful horrible)
}

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

def strip_punctuation(words)
  words.gsub(/[!.#,]/, "")
end

def happy_days(array)
  entries = 0
  happy_faces = 0
  array.each do |line|
    if happy_faces < 3
      emotion = analyze_mood(line)
      entries += 1
      if emotion == ":-)"
      happy_faces += 1
      break if happy_faces == 3
      end
    end
  end
  if happy_faces == 3
    return "It takes #{entries} entries for 3 happy days to occur"
  else
    return "Not enough happy days!"
  end
end

def overall_mood(array)
  happy_moods = []
  sad_moods = []
  neutral_moods =[]
  array.each do |line|
    moods = analyze_mood(line)
    if moods == ":-)"
      happy_moods << moods
    elsif moods == ":-("
      sad_moods << moods
    else
      neutral_moods << moods
    end
  end
  happy_length = happy_moods.length
  sad_length = sad_moods.length
  neutral_length = neutral_moods.length

  if happy_length > sad_length && happy_length > neutral_length
    return "The most common mood is :-)"
  elsif sad_length > happy_length && sad_length > neutral_length
    return "The most common mood is :-("
  else
    return "The most common mood is :-|"
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

text.each do |line|
  puts line[0..5] + analyze_mood(line)
end

puts happy_days(text)
puts overall_mood(text)
