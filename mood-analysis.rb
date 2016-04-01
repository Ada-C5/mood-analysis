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

def strip_punctuation(sentence)
  sentence.gsub(/[[:punct:]]/, "")
end

def happy_days(journal)
  entries = 0
  happy_count = 0
  # wanted to do this with reduce but didn't get it figuerd out :/
  journal.each do |entry|
    happy_count += 1 if analyze_mood(strip_punctuation(entry)) == ":-)"
    entries += 1
    if happy_count > 3
      break
    end
  end
  if happy_count < 3
    puts "In all #{entries} enterest, there were not 3 happy days! Sorry :-(."
  else
    puts "It takes #{entries} entries for 3 happy days to occur."
  end
end

def overall_mood(journal)
  entry_moods_frequency = {":-)" => 0, ":-(" => 0, ":-|" => 0}

  journal.each do |entry|
    mood = analyze_mood(strip_punctuation(entry))
    case mood
    when ":-)"
      entry_moods_frequency[":-)"] += 1
    when ":-("
      entry_moods_frequency[":-("] +=1
    when ":-|"
      entry_moods_frequency[":-|"] +=1
    end

  end

  most_common_mood = entry_moods_frequency.max_by do |mood, count|
    count
  end

  puts "The most common mood is #{most_common_mood[0]}. #{entry_moods_frequency}"

end

text = [
  "03/01 I'm having a terrible horrible no good day.",
  "03/13 Yesterday was horrible, but today is great! Yay!",
  "04/02 Sad Panda. #terribleday",
  "04/15 Hello World, today is fabulous! #yay",
  "05/01 Great! Yay! Good! Yay! Happy. Happy.",
  "05/11 Yay, yay, yay! I'm having a awfuly great day."
]

text.each do |entry|
  daily_mood = analyze_mood(strip_punctuation(entry))
  date = entry[0..5]
  puts date + daily_mood
end

# puts analyze_mood(text[0])
# puts analyze_mood(text[1])
