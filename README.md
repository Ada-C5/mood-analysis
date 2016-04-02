# Mood Analysis: Hash Practice
Let's practice interacting with Hashes (key-value pairings) by writing a program that creates hashes, stores data in hashes, retrieves data from hashes, and prints the contents of a hash.

## mood-analysis.rb
Take a look at [mood-analysis.rb](mood-analysis.rb).

### What's Happening?
Explain what is happening on each of the following lines in the code.

| Line # | What's happening?
|:------:|-------------------
| 1      | constant variable storing a hash of arrays
| 2      | key, value assigned to an array
| 3      | key, value assigned to an array
| 6      | method signature with a parameter of one
| 7-8    | local variable set to 0 within the method
| 9      | method called on the passed in word that is being stored in the local variable word.
| 10     | method call, to look at each word in the array
| 11     | is the conditional being met
| 12     | increment happy count
| 13     | is the conditional being met
| 14     | increment sad count
| 17-19  | this will return the value of either a happy or sad face if the conditional is meet. if no conditional is met, it will return with a neutral face

### Data Types
What's the Data Type of the following?

| Code                       | Data Type
|----------------------------|-----------
| FEELINGS                   | hash
| :sad                       | symbol
| happy                      | fixnum
| words                      | string
| words.split(" ")           | array of strings
| FEELINGS[:sad]             | array
| FEELINGS[:happy].include?  | boolean
| analyze_mood(text)         | method call

### Explaining the Code
| Question               | Answer
|------------------------|-------
| Why do we need line 9? | all the words are the same text
| What is the relationship between `words` and `word` (line 10)? | word is the collection of the words in an array, word one word in the words array
!!| Why doesn't line 19 have an associated if/condition? | it is the return value if the conditional is not met
!!| What is the relationship between `text[0]`, `text[1]`, and `words`? | words is getting the value of text value of what is needed to be put in

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

I believe that arrays are more useful when using data and it involves collecting a collection of elements.

**think**: What if we eventually want to add feelings to our analysis? Can we write this code in a way that will prevent us from having to re-write it later?
Yes! 
