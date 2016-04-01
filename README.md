# Mood Analysis: Hash Practice
Let's practice interacting with Hashes (key-value pairings) by writing a program that creates hashes, stores data in hashes, retrieves data from hashes, and prints the contents of a hash.

## mood-analysis.rb
Take a look at [mood-analysis.rb](mood-analysis.rb).

### What's Happening?
Explain what is happening on each of the following lines in the code.

| Line # | What's happening?
|:------:|-------------------
| 1      | FEELINGS constant is initialized with a hash
| 2      | Hash key happy containing an array of happy moods
| 3      | Hash key sad containing an array of sad moods
| 6      | Method analyze_moods takes in the parameter words
| 7-8    | happy and sad variables are instantiated with integers 
| 9      | words are sanitized with downcase 
| 10     | words get split into an array of individual words
| 11     | if array contains a word that matches the happy feelings hash
| 12     | local variable happy gets incremented 
| 13     | if array contains a word that matches the sad feelings hash
| 14     | local variable sad gets incremented 
| 17-19  | happy face is returned if happiness is greater than sadness, sad face is returned if sadness is greater than happiness, meh face is returned if they are equal 

### Data Types
What's the Data Type of the following?

| Code                       | Data Type
|----------------------------|-----------
| FEELINGS                   | constant containing hash 
| :sad                       | symbol
| happy                      | fixnum 
| words                      | string
| words.split(" ")           | array of string
| FEELINGS[:sad]             | array
| FEELINGS[:happy].include?  | boolean, true or false
| analyze_mood(text)         | string

### Explaining the Code
| Question               | Answer
|------------------------|-------
| Why do we need line 9? | sanitize input to match hash of feelings
| What is the relationship between `words` and `word` (line 10)? | word is each element in the words array 
| Why doesn't line 19 have an associated if/condition? | the other two conditions will not execute if the feelings are equal 
| What is the relationship between `text[0]`, `text[1]`, and `words`? |
words gets the values of text[0] on the first run through the method
words gets the values of text[1] on the second run through the method 

### Assignment: Requirements
1. Replace lines 31 and 32 and write a loop to print out each day and the emoticon that is associated by analyzing the mood of that day.

Your result will look like:
```
03/01  :-(
03/13  :-|
...
```

**think**: Why does 03/13 come out as _neutral_ when it should be _happy_? How could we fix this?
The exclamation in front of ! yay is causing yay to not be read by the loop and the same problem is happening with 05/01 as well. 

2. To make the results a little more accurate, let's write and utilize a method called `strip_punctuation` to strip out the punctuation that affects the results. Namely, remove  exclamation marks (!), periods (.), commas (,), and hashtags (#).

Your method should take a string as an argument and return the string without the above mentioned punctuation.

After writing this method, our new result should be:
```
03/01  :-(
03/13  :-)
...
```

**think**: Where should we call `strip_punctuation`? Does it matter? Why?
before we iterate and analyze the data. It does matter otherwise you will get bad data 

3. Write a method called `happy_days` to determine how many logged entries it takes until there have been three :-) happy days.

Your output could be something like:
```
It takes 5 entries for 3 happy days to occur
```

**think**: What are you going to do if there aren't at least 3 happy days? Where do you need to handle that case?
At the end of the loop, maybe return something about there only being x number of happy days for the total number of days

4. Write a method called `overall_mood` to determine the most common mood across all logged entries.

Your output could be something like:
```
The most common mood is :-)
```

**think**: Should you use an array or a hash to solve this problem? Why?
For counting until happy days, an Array because order matters
For overall mood, a Hash because order does not matter. But I also already have an array to work with so I just recycled the data I already had because honestly it's past midnight and my brain is only working partially. 

**think**: What if we eventually want to add feelings to our analysis? Can we write this code in a way that will prevent us from having to re-write it later?
