
FEELINGS = {
  happy: %w(yay, good, great),
  sad: %w(terrible, awful, horrible)
}

def analyze_mood(words)
  happy = 0
  sad = 0
  words.downcase!
  words.gsub(/[!.#,]/, "").split(" ").each do |word|
    puts word
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


(0..text.count-1).map do |i|
  "#{text[i].split(" ")[0]} #{analyze_mood(text[i])}"
 [text[i].split(" ")[0], analyze_mood(text[i])]
end



def strip_punctuation(words)
   words.gsub(/[!.#,]/, "")
end

def happy_days(text)
count = 0
happy = 0
sad = 0
neutral = 0
(0..text.count-1).map do |i|
  days =  [text[i].split(" ")[0], analyze_mood(text[i])]
  count += 1
  if days[1].include? "("
  sad += 1
  elsif days[1].include? "|"
  neutral += 1
  else days[1].include? ")"
  happy += 1
  if happy < 3
  break
  end
   end

    end
    return "It takes #{count} entries for #{happy} happy days to occur"
end


def overall_mood(text)
b = []
count = 0
happy = 0
sad = 0
neutral = 0
(0..text.count-1).map do |i|
day =   [text[i].split(" ")[0], analyze_mood(text[i])]
if day[1].include? "("
sad += 1
b << sad
elsif day[1].include? ")"
happy += 1
b << happy
else
neutral += 1
b << neutral
end

end
 a = {happy => ":-)" , sad => ":-(", neutral => ":-|"}
c =   a.max_by{|k,v|k}
"The most common mood is #{c[1]}"
end

# {(0..text.count - 1).to_a.each {|i| puts analyze_mood(text[i])}}, text.each {|b| b.split(" ")[0]}
#
#   puts "#{a}, #{(0..text.count - 1).to_a.each {|i| puts analyze_mood(text[i])}}  "}}
#
#
#
# (0..text.count - 1).to_a.each {|i| puts analyze_mood(text[i])}

(0..text.count-1).each do |i|
  puts "#{text[i].split(" ")[0]} #{analyze_mood(text[i])}"
end



#
# (0..text.count-1).each do |i|
#    text.each do |b|
#     puts "#{b.split(" ")[0]} #{analyze_mood(text[i])}"
#     puts b
#   end
# end


# puts analyze_mood(text[0])
# puts analyze_mood(text[1])
