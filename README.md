# Mood Analysis: Hash Practice
Let's practice interacting with Hashes (key-value pairings) by writing a program that creates hashes, stores data in hashes, retrieves data from hashes, and prints the contents of a hash.

## mood-analysis.rb
Take a look at [mood-analysis.rb](mood-analysis.rb).

### What's Happening?
Explain what is happening on each of the following lines in the code.

| Line # | What's happening?
|:------:|-------------------
| 1      |setting a constant with hash
| 2      |key, value (an array) pair
| 3      |key, value (an array) pair
| 6      |defining method with parameter (word)
| 7-8    |setting local variable to zero
| 9      |making all letters in parameter lowercase
| 10     |for each word (argument) split on the space  and  iterate each one
| 11     |does the word being iterated included in Constant FEELINGS with :happy or (yay, good, great)?
| 12     |increments count for happy
| 13     |does the word being iterated included in Constant FEELINGS with :sad or (terrible, awful, horrible)?
| 14     |increments count for sad
| 17-19  |explicit returns based on the happy sad values count tally

### Data Types
What's the Data Type of the following?

| Code                       | Data Type
|----------------------------|-----------
| FEELINGS                   |hash
| :sad                       |symbol
| happy                      |fixnum
| words                      |string
| words.split(" ")           |array of strings
| FEELINGS[:sad]             |array
| FEELINGS[:happy].include?  |Boolean
| analyze_mood(text)         |string

### Explaining the Code
| Question               | Answer
|------------------------|-------
| Why do we need line 9? |to make sure we are evaluating based on same text type
| What is the relationship between `words` and `word` (line 10)? | words refers to the array, while word is each member of the array that is being evaluated
| Why doesn't line 19 have an associated if/condition? |it acts as default if prior conditions are not met
| What is the relationship between `text[0]`, `text[1]`, and `words`? |text [0] and text[1] are the elements of an array that contain the parameters or 'words'

### Assignment: Requirements
1. Replace lines 31 and 32 and write a loop to print out each day and the emoticon that is associated by analyzing the mood of that day.

Your result will look like:
```
03/01  :-(
03/13  :-|
...
```

**think**: Why does 03/13 come out as _neutral_ when it should be _happy_? How could we fix this?

2. To make the results a little more accurate, let's write and utilize a method called `strip_punctuation` to strip out the punctuation that affects the results. Namely, remove  exclamation marks (!), periods (.), commas (,), and hashtags (#).

Your method should take a string as an argument and return the string without the above mentioned punctuation.

After writing this method, our new result should be:
```
03/01  :-(
03/13  :-)
...
```

**think**: Where should we call `strip_punctuation`? Does it matter? Why?

3. Write a method called `happy_days` to determine how many logged entries it takes until there have been three :-) happy days.

Your output could be something like:
```
It takes 5 entries for 3 happy days to occur
```

**think**: What are you going to do if there aren't at least 3 happy days? Where do you need to handle that case?

4. Write a method called `overall_mood` to determine the most common mood across all logged entries.

Your output could be something like:
```
The most common mood is :-)
```

**think**: Should you use an array or a hash to solve this problem? Why?

**think**: What if we eventually want to add feelings to our analysis? Can we write this code in a way that will prevent us from having to re-write it later?
