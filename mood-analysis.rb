FEELINGS = {
  happy: %w(yay good great),
  sad: %w(terrible awful horrible)
}

def analyze_mood(words)
  happy = 0
  sad = 0
  words.downcase!

  # using regex to extract the punctuation
  words.gsub!(/[^[:word:]\s]/, ' ')

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

def happy_days(result)
  happy_days = 0
  day_count = 0

  result.each do |journal|

    mood = journal[1]

    if happy_days < 3
      day_count += 1
       happy_days += 1 if mood == ":-)"
    end
  end
  day_count
end


def overall_mood(result)

  overall_mood_result = {}
  overall_mood_result[":-)"] = 0
  overall_mood_result[":-|"] = 0
  overall_mood_result[":-("] = 0

    result.each do |journal|
      overall_mood_result[journal[1]] += 1
    end

    overall_mood_result.max_by {|mood, count| count}.first

end

text = [
  "03/01 I'm having a terrible horrible no good day.",
  "03/13 Yesterday was horrible, but today is great! Yay!",
  "04/02 Sad Panda. #terribleday",
  "04/15 Hello World, today is fabulous! #yay",
  "05/01 Great! Yay! Good! Yay! Happy. Happy.",
  "05/11 Yay, yay, yay! I'm having a awfuly great day."
]

result = text.map do |day|
  date = day.split(" ").first
  mood = analyze_mood(day)
  puts
  puts "#{date} #{mood}"

  [date, mood]
end

puts "It takes #{happy_days(result)} entries for 3 happy days to occur"
puts "The most common mood is #{overall_mood(result)}"
