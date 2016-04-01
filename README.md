# Mood Analysis: Hash Practice
Let's practice interacting with Hashes (key-value pairings) by writing a program that creates hashes, stores data in hashes, retrieves data from hashes, and prints the contents of a hash.

## mood-analysis.rb
Take a look at [mood-analysis.rb](mood-analysis.rb).

### What's Happening?
Explain what is happening on each of the following lines in the code.

| Line # | What's happening?
|:------:|-------------------
| 1      |creating a constant var hash
| 2      |creating happy key with array of happy words
| 3      |creating sad key with array of sad words
| 6      |method to analyze moods based on input
| 7-8    |start happy and sad word count at 0
| 9      |force all words to be permanently downcase
| 10     |break up the input based on spacing and step through each word
| 11     |checks to see if the word is used in the happy array
| 12     |increases the count of happy by 1
| 13     |checks to see if the word is used in the sad array
| 14     |increases the count of sad by 1
| 17-19  |checks which count is highest and returns an appropriate face

### Data Types
What's the Data Type of the following?

| Code                       | Data Type
|----------------------------|-----------
| FEELINGS                   |hash
| :sad                       |array of strings
| happy                      |fixnum
| words                      |string
| words.split(" ")           |array of strings
| FEELINGS[:sad]             |array of sad strings
| FEELINGS[:happy].include?  |boolean
| analyze_mood(text)         |string

### Explaining the Code
| Question               | Answer
|------------------------|-------
| Why do we need line 9? |to make sure that all the words stay downcase!
| What is the relationship between `words` and `word` (line 10)? | words is the whole string and word is each word within the string
| Why doesn't line 19 have an associated if/condition? |because lines 17 and 18 already cover the possible cases
| What is the relationship between `text[0]`, `text[1]`, and `words`? | they are the indexes (strings) that are placed into the words argument

### Assignment: Requirements
1. Replace lines 31 and 32 and write a loop to print out each day and the emoticon that is associated by analyzing the mood of that day.

Your result will look like:
```
03/01  :-(
03/13  :-|
...
```

**think**: Why does 03/13 come out as _neutral_ when it should be _happy_? How could we fix this? because it can't comprehend punctuation in the .include method. We fix it by removing all punctuation in the happy/sad array and in the input string

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
