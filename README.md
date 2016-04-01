# Mood Analysis: Hash Practice
Let's practice interacting with Hashes (key-value pairings) by writing a program that creates hashes, stores data in hashes, retrieves data from hashes, and prints the contents of a hash.

## mood-analysis.rb
Take a look at [mood-analysis.rb](mood-analysis.rb).

### What's Happening?
Explain what is happening on each of the following lines in the code.

| Line # | What's happening?
|:------:|-------------------
| 1      | an hash is being assigned
| 2      | a array is being assigned to the key happy
| 3      | a array is being assigned to the key sad
| 6      | an instance method "analyze_mood" is define and expecting one input
| 7-8    | sets happy and sad value to zero
| 9      | sets the variable word to all lower case letters
| 10     | the words are split into an array by the spaces and each iteration goes through a word in the array
| 11     | checks if the element exists in the happy key
| 12     | adds one point to the value of happy
| 13     | if line 10 fails, checks if the element exists in the sad key array
| 14     | adds one point to the value of sad
| 17-19  | compares happy and sad values and returns a string

### Data Types
What's the Data Type of the following?

| Code                       | Data Type
|----------------------------|-----------
| FEELINGS                   |hash
| :sad                       |key/symbol
| happy                      |variable/fixnum
| words                      |variable/string
| words.split(" ")           |array
| FEELINGS[:sad]             |array
| FEELINGS[:happy].include?  |boolean
| analyze_mood(text)         | instance method/string

### Explaining the Code
| Question               | Answer
|------------------------|-------
| Why do we need line 9? | All values in the hash are in lower case
| What is the relationship between `words` and `word` (line 10)? 
|words becomes an array full of 'word' instances
| Why doesn't line 19 have an associated if/condition? 
| it is only run if the previous two return conditions are false
| What is the relationship between `text[0]`, `text[1]`, and `words`? 
|"words" is equal to text[x] if used like in line 31-32

### Assignment: Requirements
1. Replace lines 31 and 32 and write a loop to print out each day and the emoticon that is associated by analyzing the mood of that day.

Your result will look like:
```
03/01  :-(
03/13  :-|
...
```

**think**: Why does 03/13 come out as _sad_ when it should be _happy_? How could we fix this? the include? method doesn't work when word is not exactly the same as the element in the array. "yay!" is not equal to "yay"

2. To make the results a little more accurate, let's write and utilize a method called `strip_punctuation` to strip out the punctuation that affects the results. Namely, remove  exclamation marks (!), periods (.), commas (,), and hashtags (#).

Your method should take a string as an argument and return the string without the above mentioned punctuation.

After writing this method, our new result should be:
```
03/01  :-(
03/13  :-)
...
```

**think**: Where should we call `strip_punctuation`? Does it matter? Why? You can call strip_punctuation right after line 14 because this is the only point in the code where the words are being analyzed individually or replace element in line 38. I think it's easier to read if you put it in line 14.

3. Write a method called `happy_days` to determine how many logged entries it takes until there have been three :-) happy days.

Your output could be something like:
```
It takes 5 entries for 3 happy days to occur
```

**think**: What are you going to do if there aren't at least 3 happy days? On line 49, the code is supposed to break if the number of happy entries reaches 3. If not, it will finish running through all the entries and output the greatest number of happy entries in the whole journal. We can add an if statement in the happy_days method that returns a different text if happy_entries never reaches 3.

4. Write a method called `overall_mood` to determine the most common mood across all logged enries.

Your output could be something like:
```
The most common mood is :-)
```

**think**: Should you use an array or a hash to solve this problem? Why? A hash would be easier to use and read. If an array is used, there may be confusion on which 'face' is used for which element. Assigning the 'face' as the keys makes it clear.

**think**: What if we eventually want to add feelings to our analysis? Can we write this code in a way that will prevent us from having to re-write it later?
