# Mood Analysis: Hash Practice
Let's practice interacting with Hashes (key-value pairings) by writing a program that creates hashes, stores data in hashes, retrieves data from hashes, and prints the contents of a hash.

## mood-analysis.rb
Take a look at [mood-analysis.rb](mood-analysis.rb).

### What's Happening?
Explain what is happening on each of the following lines in the code.

| Line # | What's happening?
|:------:|-------------------
| 1      |Declaring constant variable
| 2      |Declaring happy key-value pair
| 3      |Declaring sad key-value pair
| 6      |Declaring method
| 7-8    |Declaring variables
| 9      |Making words lowercase
| 10     |Making string into array of words and looping through each word
| 11     |Checking happy key in FEELINGS for the word
| 12     |Add 1 to happy if word is in happy value array
| 13     |Checking sad key in FEELINGS for the word
| 14     |Add 1 to sad if word is in sad value array
| 17-19  |Return appropriate smiley based on happiness/sadness values

### Data Types
What's the Data Type of the following?

| Code                       | Data Type
|----------------------------|-----------
| FEELINGS                   |Hash
| :sad                       |Symbol
| happy                      |Fixnum
| words                      |String
| words.split(" ")           |Array
| FEELINGS[:sad]             |Array
| FEELINGS[:happy].include?  |Boolean
| analyze_mood(text)         |String

### Explaining the Code
| Question               | Answer
|------------------------|-------
| Why do we need line 9? |Lines 11 and 13 are case sensitive
| What is the relationship between `words` and `word` (line 10)? | words is a string and word is an element of an array
| Why doesn't line 19 have an associated if/condition? | It is essentially the else statement.
| What is the relationship between `text[0]`, `text[1]`, and `words`? | words is a parameter, text[0] and text[1] are arguments.

### Assignment: Requirements
1. Replace lines 31 and 32 and write a loop to print out each day and the emoticon that is associated by analyzing the mood of that day.

Your result will look like:
```
03/01  :-(
03/13  :-|
...
```

**think**: Why does 03/13 come out as _neutral_ when it should be _happy_? How could we fix this?

Both happy and sad values are 0 because each happy and sad word has punctuation attached so the words aren't matching during the .include method. This could be fixed by looping each word through a method that strips punctuation.

2. To make the results a little more accurate, let's write and utilize a method called `strip_punctuation` to strip out the punctuation that affects the results. Namely, remove  exclamation marks (!), periods (.), commas (,), and hashtags (#).

Your method should take a string as an argument and return the string without the above mentioned punctuation.

After writing this method, our new result should be:
```
03/01  :-(
03/13  :-)
...
```

**think**: Where should we call `strip_punctuation`? Does it matter? Why?
We should call strip_punctuation before running the analyze_mood. It matters because analyze_mood cannot produce an accurate result until the punctuation is removed.

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
