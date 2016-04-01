# Mood Analysis: Hash Practice
Let's practice interacting with Hashes (key-value pairings) by writing a program that creates hashes, stores data in hashes, retrieves data from hashes, and prints the contents of a hash.

## mood-analysis.rb
Take a look at [mood-analysis.rb](mood-analysis.rb).

### What's Happening?
Explain what is happening on each of the following lines in the code.

| Line # | What's happening?
|:------:|-------------------
| 1      | Constant set to a hash
| 2      |key :happy and value array of happy words
| 3      |key :sad and value array of sad words
| 6      |method definition with one parameter (words)
| 7-8    |two local variables happy = 0 and sad = 0
| 9      |the downcase! method is used on the parameter words and because of the ! it is transformed
| 10     |split converts the words parameter into an array with a strings each iterators over each string
| 11     |if the feelings constant hash happy key value includes word  the
| 12     |happy variable gets one added to it
| 13     |elsif the  feelings constant hash sad key value includes  word the
| 14     |sad variable gets one added to it
| 17-19  |if the value of happy > sad a simile is returned if the value of happy is less than sad a frowny face is returned if they are the same netural face is returned

### Data Types
What's the Data Type of the following?

| Code                       | Data Type
|----------------------------|-----------
| FEELINGS                   |hash
| :sad                       |symbol
| happy                      |fixnum
| words                      |strings
| words.split(" ")           |array of strings
| FEELINGS[:sad]             |array of strings
| FEELINGS[:happy].include?  |boolean
| analyze_mood(text)         |string

### Explaining the Code
| Question               | Answer
|------------------------|-------
| Why do we need line 9? | to make sure all the words are in lowercase letters
| What is the relationship between `words` and `word` (line 10)? | word is a string in the words array
| Why doesn't line 19 have an associated if/condition? | implicit return
| What is the relationship between `text[0]`, `text[1]`, and `words`? |

### Assignment: Requirements
1. Replace lines 31 and 32 and write a loop to print out each day and the emoticon that is associated by analyzing the mood of that day.

Your result will look like:
```
03/01  :-(
03/13  :-|
...
```

**think**: Why does 03/13 come out as _sad_ when it should be _happy_? How could we fix this?
the yay! and great! have exclamation points which the includ? method does not read.

2. To make the results a little more accurate, let's write and utilize a method called `strip_punctuation` to strip out the punctuation that affects the results. Namely, remove  exclamation marks (!), periods (.), commas (,), and hashtags (#).


def strip_punctuation(words)
   words.gsub(/[!.#,]/, "")
end

Your method should take a string as an argument and return the string without the above mentioned punctuation.

After writing this method, our new result should be:
```
03/01  :-(
03/13  :-)
...
```

**think**: Where should we call `strip_punctuation`? Does it matter? Why?
This method should be called right before the split method because words with punctuation will not be evaluated correctly if it is not applied.


3. Write a method called `happy_days` to determine how many logged entries it takes until there have been three :-) happy days.


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






(0..text.count-1).map do |i|
      days = []
   puts "#{text[i].split(" ")[0]} #{analyze_mood(text[i])}"
     [text[i].split(" ")[0], analyze_mood(text[i])]
  end

puts "#{text[i].split(" ")[0]} #{analyze_mood(text[i])}"




Your output could be something like:
```
It takes 5 entries for 3 happy days to occur
```

**think**: What are you going to do if there aren't at least 3 happy days? Where do you need to handle that case?




4. Write a method called `overall_mood` to determine the most common mood across all logged entries.

Your output could be something like:
```
The most common mood is :-)

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
c[1]
end
```

**think**: Should you use an array or a hash to solve this problem? Why?


**think**: What if we eventually want to add feelings to our analysis? Can we write this code in a way that will prevent us from having to re-write it later?
