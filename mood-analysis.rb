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

def strip_punctuation(words)
  words.downcase.gsub(/[^0-9^a-z ]/, '')
end

def happy_days(day)
  count = 0
  day_record = 0
  num_days_before_happy_three = 0
  text.each do |aline|
    count += 1
    line = strip_punctuation(aline)
    face = analyze_mood(line)
    (day_record += 1) if face==":-)"
    if day_record == 3 && num_days_before_happy_three == 0
      num_days_before_happy_three = count
    end
  end
  if num_days_before_happy_three == 0
    puts "WHY ARE YOU SO SAD"
  else
    puts "It takes #{num_days_before_happy_three} entries for 3 happy days to occur"
  end
end

def overall_mood
  all = {
    positive: 0,
    negative: 0
    meh: 0
  }
  text.each do |aline|
    line = strip_punctuation(aline)
    face = analyze_mood(line)
    if face == ":-)"
      all[:positive] +=1
    if face == ":-("
      all[:negative] +=1
    else
      all[:meh] +=1
    end
  end
  largest = all.max_by{|key, value| value}
  puts "#{largest.keys} is most common mood" 
end


text = [
  "03/01 I'm having a terrible horrible no good day.",
  "03/13 Yesterday was horrible, but today is great! Yay!",
  "04/02 Sad Panda. #terribleday",
  "04/15 Hello World, today is fabulous! #yay",
  "05/01 Great! Yay! Good! Yay! Happy. Happy.",
  "05/11 Yay, yay, yay! I'm having a awfuly great day."
]

text.each do |aline|
  line = strip_punctuation(aline)
  face = analyze_mood(line)
  puts "#{line[0,2]}/#{line[2,3]} #{face}"
end
