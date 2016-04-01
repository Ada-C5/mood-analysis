FEELINGS = {
  happy: %w(yay good great),
  sad: %w(terrible awful horrible)
}

def strip_punctuation(string)
  string.to_s.gsub(/[^a-z0-9\/\s]/i, '')
end

def analyze_mood(words)
  words = strip_punctuation(words)
  happy = 0
  sad = 0
  meh = 0
  words.downcase!
  words.split(" ").each do |word|
    if FEELINGS[:happy].include? word
      happy += 1
    elsif FEELINGS[:sad].include? word
      sad += 1
    else meh += 1
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


  text.each do |entry|
  puts "#{entry[0..4]} #{analyze_mood(entry)}"
  end

  #determine how many logged entries it takes until there have been three :-) happy days.
  def happy_days(text)
    good_days = 0
    day_count = 0
    text.each do |text|
      if good_days < 3 #if there aren't at least 3 happy days?
        day_count += 1
        if analyze_mood(text) == ":-)"
          good_days += 1
        end
      end
    end
    puts "It takes #{day_count} days for 3 happy days to occur."
  end

  #to determine the most common mood across all logged entries
  def overall_mood(text)
    happy = 0
    sad = 0
    meh = 0
      text.each do |entry|
        if analyze_mood(entry) == ":-)"
          happy += 1
        elsif analyze_mood(entry) == ":-("
          sad += 1
        else
          meh += 1
        end
      end
    if happy > sad
      puts "The most common mood is :-)"
    elsif happy < sad
      puts "The most common mood is :-("
    else sad == happy || meh == 0
      puts "The most common mood is :-|"
    end
  end


  happy_days(text)
  overall_mood(text)
