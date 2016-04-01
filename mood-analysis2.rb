FEELINGS = {
  happy: [%w(yay good great), 0, ":-)"],
  sad: [%w(terrible awful horrible), 0, ":-("]
}

@text = [
  "03/01 I'm having a terrible horrible no good day.",
  "03/13 Yesterday was horrible, but today is great! Yay!",
  "04/02 Sad Panda. #terribleday",
  "04/15 Hello World, today is fabulous! #yay",
  "05/01 Great! Yay! Good! Yay! Happy. Happy.",
  "05/11 Yay, yay, yay! I'm having a awfuly great day."
]

def strip_punctuation(words)
  return words.downcase.gsub(/[^a-z0-9\s]/i, '')
end

def analyze_mood(words)
  words.downcase!
  words_stripped = strip_punctuation(words)

  words_stripped.split(" ").each do |word|
    FEELINGS.values.each do |array|
      if array[0].include? word
        array[1] += 1
      end
    end
  end

  more_matches = FEELINGS.values.max_by { |array| array[1] }

  # Need to work on determine if neutral 

  return more_matches[2]

end


def print_moods
  @text.each do |each_entry|
    puts each_entry[0..4] + " " + analyze_mood(each_entry)
  end
end

def happy_days
  desired_happy = 3
  count_happy = 0
  entry_count = 0  # is count automated somewhere else?

  @text.each do |each_entry|
    entry_count += 1
    mood = analyze_mood(each_entry)
    if mood == ":-)"
      count_happy += 1
    end
    if count_happy == 3
      return puts "It takes #{entry_count} entries for 3 happy days to occur."   # Is it correct to return a puts since we just want a console output??
    end
  end
  return puts "We did not find 3 happy days in the input data."
end

def overall_mood
  happy_count = 0
  sad_count = 0

  @text.each do |each_entry|
    mood = analyze_mood(each_entry)
    happy_count += 1 if mood == ":-)"
    sad_count += 1 if mood == ":-("
  end

  puts "Both moods are equally common." if happy_count == sad_count
  puts "The most common mood is :-(" if sad_count > happy_count
  puts "The most common mood is :-)" if happy_count > sad_count
end

print_moods
