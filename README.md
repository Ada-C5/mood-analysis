# Mood Analysis: Hash Practice
Let's practice interacting with Hashes (key-value pairings) by writing a program that creates hashes, stores data in hashes, retrieves data from hashes, and prints the contents of a hash.

## mood-analysis.rb
Take a look at [mood-analysis.rb](mood-analysis.rb).

### What's Happening?
Explain what is happening on each of the following lines in the code.

| Line # | What's happening?
|:------:|-------------------
| 1      |set FEELINGS constant
| 2      |happy symbol is key for positive words
| 3      |sad symbol key for negative words
| 6      |defines analyze_mood method
| 7-8    |sets happy/sad counts to 0
| 9      |standardize capitalization
| 10     |splits into each word to examine individually
| 11     |if the current word is included in happy word array
| 12     |adds 1 to happy count
| 13     |if the current word is included in sad word array
| 14     |adds 1 sad count
| 17-19  |return emoji for happy if happy word count more sad emoji for less meh for equal

### Data Types
What's the Data Type of the following?

| Code                       | Data Type
|----------------------------|-----------
| FEELINGS                   |CONSTANT
| :sad                       |symbol
| happy                      |variable / fixnum
| words                      |string
| words.split(" ")           |(str method call-> )array
| FEELINGS[:sad]             |array
| FEELINGS[:happy].include?  |boolean
| analyze_mood(text)         |method

### Explaining the Code
| Question               | Answer
|------------------------|-------
| Why do we need line 9? | standardize capitalization in case of nonmatching capitalization given in input
| What is the relationship between `words` and `word` (line 10)? |words is collection of word elements
| Why doesn't line 19 have an associated if/condition? |incase happy count = sad count
| What is the relationship between `text[0]`, `text[1]`, and `words`? |first line, second line of text put into method becomes words

### Assignment: Requirements
1. Replace lines 31 and 32 and write a loop to print out each day and the emoticon that is associated by analyzing the mood of that day.

Your result will look like:
```
03/01  :-(
03/13  :-|
...
```

**think**: Why does 03/13 come out as _sad_ when it should be _happy_? How could we fix this?
Not recognizing any key words. Seems like punctuation is ruining functionality where it touches keywords

2. To make the results a little more accurate, let's write and utilize a method called `strip_punctuation` to strip out the punctuation that affects the results. Namely, remove  exclamation marks (!), periods (.), commas (,), and hashtags (#).

Your method should take a string as an argument and return the string without the above mentioned punctuation.

After writing this method, our new result should be:
```
03/01  :-(
03/13  :-)
...
```

**think**: Where should we call `strip_punctuation`? Does it matter? Why?
I called it in the each loop. Dunno where else I'd put it.

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
