# Mood Analysis: Hash Practice
Let's practice interacting with Hashes (key-value pairings) by writing a program that creates hashes, stores data in hashes, retrieves data from hashes, and prints the contents of a hash.

## mood-analysis.rb
Take a look at [mood-analysis.rb](mood-analysis.rb).

### What's Happening?
Explain what is happening on each of the following lines in the code.

| Line # | What's happening?
|:------:|-------------------
| 1      | Creating a constant and assigning it a hash value
| 2      | Setting happy symbol as key and assigning as value an implicit array with three strings
| 3      | Setting sad symbol as key and assigning as value an implicit array with three strings
| 6      | Defining a method called analyze_mood where we pass an argument locally called words
| 7-8    | Setting happy and sad variables to 0
| 9      | Transforming whatever is passed as an argument to downcase
| 10     | Splitting into separate elements when there is a space. Looping through each element.
| 11     | Checking if the word we are looping through is contained in the FEELINGS constant with the happy key
| 12     |  if so, assign a value of plus one to the happy variable
| 13     | Checking if the word we are looping through is contained in the FEELINGS constant with the sad key
| 14     |  if so, assign a value of plus one to the sad variable
| 17-19  | Returning a happy or sad face depending on what variable has greater value or a neutral one if they're equal

### Data Types
What's the Data Type of the following?

| Code                       | Data Type
|----------------------------|-----------
| FEELINGS                   | hash (constant)
| :sad                       | symbol
| happy                      | fixnum (variable)
| words                      | string (argument: whatever is passed)
| words.split(" ")           | array of strings (the result of an enumerable method)
| FEELINGS[:sad]             | array of strings
| FEELINGS[:happy].include?  | boolean
| analyze_mood(text)         | string (method with one required argument)

### Explaining the Code
| Question               | Answer
|------------------------|-------
| Why do we need line 9? | To make sure we can compare strings even if entered with different capitalization
| What is the relationship between `words` and `word` (line 10)? | word is each element of the array once words is split
| Why doesn't line 19 have an associated if/condition? | There is only one alternative left
| What is the relationship between `text[0]`, `text[1]`, and `words`? | they are the value passed as arguments locally called 'words' inside the method

### Assignment: Requirements
1. Replace lines 31 and 32 and write a loop to print out each day and the emoticon that is associated by analyzing the mood of that day.

Your result will look like:
```
03/01  :-(
03/13  :-|
...
```

text.each do |words|
  puts words[0..4] + " " + analyze_mood(words)
end

**think**: Why does 03/13 come out as _sad_ when it should be _happy_? How could we fix this?
A: The method is not matching the happy words correctly because of the exclamation mark.
A: The method could exclude exclamation marks before splitting into words.

2. To make the results a little more accurate, let's write and utilize a method called `strip_punctuation` to strip out the punctuation that affects the results. Namely, remove  exclamation marks (!), periods (.), commas (,), and hashtags (#).

Your method should take a string as an argument and return the string without the above mentioned punctuation.

After writing this method, our new result should be:
```
03/01  :-(
03/13  :-)
...
```

**think**: Where should we call `strip_punctuation`? Does it matter? Why?
A: We have to call it inside the method analyze_mood before we do the word by word comparison so that it can accurately compare words without the punctuation.

3. Write a method called `happy_days` to determine how many logged entries it takes until there have been three :-) happy days.

Your output could be something like:
```
It takes 5 entries for 3 happy days to occur
```

**think**: What are you going to do if there aren't at least 3 happy days? Where do you need to handle that case?
A: My method returns a statement saying that it didn't find 3 happy days.
A: It is handled inside the happy_days method after the loop ends (meaning it never returned the other statement).

4. Write a method called `overall_mood` to determine the most common mood across all logged entries.

Your output could be something like:
```
The most common mood is :-)
```

**think**: What if we eventually want to add feelings to our analysis? Can we write this code in a way that will prevent us from having to re-write it later?
**think**: Should you use an array or a hash to solve this problem? Why?
A: The analyze_mood method should be re-written so that we could loop through all the feelings, and we would have to have a counter inside the data structure to keep track of how many words matched in the entry.
A: I think a hash with values as arrays would work:

FEELINGS = {
  happy: [%w(yay good great), 0, ":-)"],
  sad: [%w(terrible awful horrible), 0, ":-("]
}

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
  return more_matches[2]

end
