# Mood Analysis: Hash Practice
Let's practice interacting with Hashes (key-value pairings) by writing a program that creates hashes, stores data in hashes, retrieves data from hashes, and prints the contents of a hash.

## mood-analysis.rb
Take a look at [mood-analysis.rb](mood-analysis.rb).

### What's Happening?
Explain what is happening on each of the following lines in the code.

| Line # | What's happening?
|:------:|-------------------
| 1      | The constant FEELINGS is being given the value of a hash containing two keys.
| 2      | happy: is the first hash key of the FEELINGS hash. Its value is an array with three strings listed in it.  
| 3      | sad: is the second hash key of the FEELINGS hash. Its value is an array with three strings listed in it.
| 6      | The method analyze_mood(words) is being named and defined.
| 7-8    | The variables happy and sad are being set to a value of 0.
| 9      | The parameter 'words' is being permanently set to be in all downcase letters.
| 10     | The parameter 'words' is being split into an array. Then an each loop is started.
| 11     | This is the continuation of the each loop, adding an if loop inside of it. This is saying "Does the value of key ':happy' (in the constant 'FEELINGS') include any of the words in the parameter 'words' array?"
| 12     | The value of the variable 'happy' will be increased by one.
| 13     | This elsif statement statement is a continuation of the if loop of 11. It is saying "Does the value of key ':sad' (in the constant 'FEELINGS') include any of the words in the parameter 'words' array?"
| 14     | The value of the variable 'sad' will increase by one.
| 17-19  | After each word in the 'words' array has gone through the loops, these lines evaluate which has the higher value (happy or sad). If happy is higher, a smiley emoticon is returned. If sad is higher, a frowny emoticon is returned. If they are the same value a straight-face emoticon is returned.

### Data Types
What's the Data Type of the following?

| Code                       | Data Type
|----------------------------|-----------
| FEELINGS                   | Hash
| :sad                       | Symbol
| happy                      | Fixnum
| words                      | String
| words.split(" ")           | Array
| FEELINGS[:sad]             | Array
| FEELINGS[:happy].include?  | Boolean
| analyze_mood(text)         | String

### Explaining the Code
| Question               | Answer
|------------------------|-------
| Why do we need line 9? | Line 9 makes it so that the parameter words can be matched to the words in the happy: and sad: arrays, which are all in downcase.
| What is the relationship between `words` and `word` (line 10)? | 'words' is now an array of words. 'word' is one element inside of the array.
| Why doesn't line 19 have an associated if/condition? | Because it is implicit. If neither of the above conditions occur, Ruby will have returned nothing. So Ruby will move on to return the last thing.  
| What is the relationship between `text[0]`, `text[1]`, and `words`? |

### Assignment: Requirements
1. Replace lines 31 and 32 and write a loop to print out each day and the emoticon that is associated by analyzing the mood of that day.

Your result will look like:
```
03/01  :-(
03/13  :-|
...
```

**think**: Why does 03/13 come out as _neutral_ when it should be _happy_? How could we fix this? It comes out as neutral because all of the words that would normally be evaluated true (by lines 11 or 13) have a punctuation mark at the end of them in the string being evaluated. We could fix this by striping the strings of their punctuation before we turn it into an array. We could do that by adding a line in the analyze_mood method, using a gsub and a regexp.

2. To make the results a little more accurate, let's write and utilize a method called `strip_punctuation` to strip out the punctuation that affects the results. Namely, remove  exclamation marks (!), periods (.), commas (,), and hashtags (#).

Your method should take a string as an argument and return the string without the above mentioned punctuation.

After writing this method, our new result should be:
```
03/01  :-(
03/13  :-)
...
```

**think**: Where should we call `strip_punctuation`? Does it matter? Why? We need to call strip_punctuation before we call analyze_mood, because in order for analyze_mood to populate correct results the strings must be stripped of their text.

3. Write a method called `happy_days` to determine how many logged entries it takes until there have been three :-) happy days.

Your output could be something like:
```
It takes 5 entries for 3 happy days to occur
```

**think**: What are you going to do if there aren't at least 3 happy days? Where do you need to handle that case? What am I going to do? Well, I would need to change my code to account for this. I would add an else to my if/elsif loop: puts "There were less than 3 happy days in #{entries} entries. :-(" (I actually did do this, because it made sense to me to do so).

4. Write a method called `overall_mood` to determine the most common mood across all logged entries.

Your output could be something like:
```
The most common mood is :-)
```

**think**: Should you use an array or a hash to solve this problem? Why? ...Well, I used neither to solve the problem, because it made sense to me to continue to go along the path the previous methods had. To be honest, I'm not really sure how to solve the problem using arrays and hashes. ...Did I miss the point of the question? I'm sorry. :-/

**think**: What if we eventually want to add feelings to our analysis? Can we write this code in a way that will prevent us from having to re-write it later? You know, I'm not sure, and I'm kind of confused. I look forward to going over this with the class (or someone one on one), because I don't think I did this correctly. I mean, my code works, but its long and complicated, and there was probably a better way to do it. 
