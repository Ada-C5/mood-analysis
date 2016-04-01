# Mood Analysis: Hash Practice
Let's practice interacting with Hashes (key-value pairings) by writing a program that creates hashes, stores data in hashes, retrieves data from hashes, and prints the contents of a hash.

## mood-analysis.rb
Take a look at [mood-analysis.rb](mood-analysis.rb).

### What's Happening?
Explain what is happening on each of the following lines in the code.

| Line # | What's happening?
|:------:|-------------------
| 1      | assigning a constant called FEELINGS (it's a hash)
| 2      | the key :happy has an array value containing 3 strings
| 3      | the key :sad has an array value containing 3 strings
| 6      | defining a method signature that takes one argument
| 7-8    | assigning local variables the value of 0
| 9      | mutating the words parameter that's passed in so it's all lowercase
| 10     | creating an array with each element being a word (using .split(" ")), iterating through using the .each method
| 11     | check if the current word is included in the :happy value array defined in line 2
| 12     | increment the local variable happy by 1
| 13     | if the word was not in :happy, check if it's in the :sad value array
| 14     | increment the local variable sad by 1
| 17-19  | print out a different face depending on which was bigger, happy or sad (or if they were tied)

### Data Types
What's the Data Type of the following?

| Code                       | Data Type
|----------------------------|-----------
| FEELINGS                   | Hash
| :sad                       | Symbol
| happy                      | Fixnum
| words                      | String
| words.split(" ")           | Array of Strings
| FEELINGS[:sad]             | Array
| FEELINGS[:happy].include?  | Boolean
| analyze_mood(text)         | String

### Explaining the Code
| Question               | Answer
|------------------------|-------
| Why do we need line 9? | the words in FEELINGS are all lowercase, so even if the word passed in was the same, it would not match if it had uppercase letters.
| What is the relationship between `words` and `word` (line 10)? | 'words' is the string argument that was passed in, and 'word' is an individual element of the array of words
| Why doesn't line 19 have an associated if/condition? | it will only execute if the above conditions are false (which will only happen if happy == sad)
| What is the relationship between `text[0]`, `text[1]`, and `words`? | 'text[0]' and 'text[1]' are parameters passed into the method analyze_mood, which accepts an argument called 'words'.

### Assignment: Requirements
1. Replace lines 31 and 32 and write a loop to print out each day and the emoticon that is associated by analyzing the mood of that day.

Your result will look like:
```
03/01  :-(
03/13  :-|
...
```

**think**: Why does 03/13 come out as _neutral_ when it should be _happy_? How could we fix this?
03/13 comes out as _neutral_ because the happy words are next to _!_s so they don't match exactly. To fix this we could remove the punctuation.

2. To make the results a little more accurate, let's write and utilize a method called `strip_punctuation` to strip out the punctuation that affects the results. Namely, remove  exclamation marks (!), periods (.), commas (,), and hashtags (#). 

Your method should take a string as an argument and return the string without the above mentioned punctuation.

After writing this method, our new result should be:
```
03/01  :-(
03/13  :-)
...
```

**think**: Where should we call `strip_punctuation`? Does it matter? Why?
We should call it before we start looping through the array.  That way it will deal with all punctuation in the string at once.

3. Write a method called `happy_days` to determine how many logged entries it takes until there have been three :-) happy days.

Your output could be something like:
```
It takes 5 entries for 3 happy days to occur
```

**think**: What are you going to do if there aren't at least 3 happy days? Where do you need to handle that case?
You need to return a message that there aren't 3 happy days in case the count doesn't get that high.

4. Write a method called `overall_mood` to determine the most common mood across all logged entries.

Your output could be something like:
```
The most common mood is :-)
```

**think**: Should you use an array or a hash to solve this problem? Why?
I used a hash to solve this problem.  The key is the unique thing I'm trying to count (the :-(, :-), or :-|) and the value is the number of times they show up (increment by 1 whenever they are seen).

**think**: What if we eventually want to add feelings to our analysis? Can we write this code in a way that will prevent us from having to re-write it later?
We can write it so that every time a new key is encountered, it creates a new default value of 0.  That way, we're not stuck with only the keys we've already defined.