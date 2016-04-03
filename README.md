# Mood Analysis: Hash Practice
Let's practice interacting with Hashes (key-value pairings) by writing a program that creates hashes, stores data in hashes, retrieves data from hashes, and prints the contents of a hash.

## mood-analysis.rb
Take a look at [mood-analysis.rb](mood-analysis.rb).

### What's Happening?
Explain what is happening on each of the following lines in the code.

| Line # | What's happening?
|:------:|-------------------
| 1      | makes a hash and stores it to a constant variable called FEELINGS
| 2      | a key :happy with an array containing happy words as its value
| 3      | a key :sad with an array containing sad words as its value
| 6      | creates a method analyze_mood that accepts an argument "words"
| 7-8    | sets happy and sad local variables to 0
| 9      | converts words local variable to downcase
| 10     | creates an array of words that are in the words variable by separating the string where there is a space, creates iterator that pipes in each word (each element of the array)
| 11     | conditional checks if the current word from words array is in the FEELINGS hash, specifically in the value array with the :happy key
| 12     | add 1 to local happy variable
| 13     | conditional checks if the current word from words array is in the FEELINGS hash, specifically in the value array with the :sad key
| 14     | add 1 to local happy variable
| 17-19  | returns a happy emoticon if the happy counter is greater than sad counter and a sad emoticon if the opposite is true, if equal returns neutral emoticon

### Data Types
What's the Data Type of the following?

| Code                       | Data Type
|----------------------------|-----------
| FEELINGS                   | constant/hash
| :sad                       | symbol
| happy                      | local variable/fixnum
| words                      | local variable/string
| words.split(" ")           | array
| FEELINGS[:sad]             | array
| FEELINGS[:happy].include?  | boolean
| analyze_mood(text)         | string

### Explaining the Code
| Question               | Answer
|------------------------|-------
| Why do we need line 9? | include is case sensitive so when it compares our FEELINGS hash values that are all downcase, it needs to compare against a word that is also downcase
| What is the relationship between `words` and `word` (line 10)? | words is the string of words passed in to analyze_mood and word is each individual word in that string
| Why doesn't line 19 have an associated if/condition? | if neither happy nor sad are greater than the other then we can assume they're equal and that's what we should return if they're equal
| What is the relationship between `text[0]`, `text[1]`, and `words`? | text[0] and text[1] are both instances of words being passed into analyze_mood

### Assignment: Requirements
1. Replace lines 31 and 32 and write a loop to print out each day and the emoticon that is associated by analyzing the mood of that day.

Your result will look like:
```
03/01  :-(
03/13  :-|
...
```

**think**: Why does 03/13 come out as _neutral_ when it should be _happy_? How could we fix this?

We could look for key words like yesterday and today. Also I'm guessing that yay with an exclamation point won't count as included in the happy array.

2. To make the results a little more accurate, let's write and utilize a method called `strip_punctuation` to strip out the punctuation that affects the results. Namely, remove  exclamation marks (!), periods (.), commas (,), and hashtags (#).

Your method should take a string as an argument and return the string without the above mentioned punctuation.

After writing this method, our new result should be:
```
03/01  :-(
03/13  :-)
...
```

**think**: Where should we call `strip_punctuation`? Does it matter? Why?

I call it inside the analyze_mood method at the top so that the rest of the method uses the correct version of words. You could call it before the mood-analysis method and then use its output but we kniw

3. Write a method called `happy_days` to determine how many logged entries it takes until there have been three :-) happy days.

Your output could be something like:
```
It takes 5 entries for 3 happy days to occur
```

**think**: What are you going to do if there aren't at least 3 happy days? Where do you need to handle that case?

I decided to have an alternative string to puts when the total entries didn't include at least 3 happy days. I put it at the end of my overall_mood method.

4. Write a method called `overall_mood` to determine the most common mood across all logged entries.

Your output could be something like:
```
The most common mood is :-)
```

**think**: Should you use an array or a hash to solve this problem? Why?

Creating a hash with the emoticon as the key is useful here because then we can refer to it's values using the emoticon. Its values are a collection of that emoticon stored in an array. You can then compare the size of each value array and find the max.

**think**: What if we eventually want to add feelings to our analysis? Can we write this code in a way that will prevent us from having to re-write it later?

Finding the most frequent emoticon without specifically referencing ":-)", ":-(", and ":-|" will make it so you can add more feelings and associated emoticons without having to rewrite code -- hopefully. I think the overall_mood, strip_punctuation and happy_days methods would be fine but the analyze_mood method would need to be written to find the most frequent feeling instead of the looking at the specific happy and sad counters. Of course all of the other methods rely on that method so it would be pretty important to rewrite it if we needed to start accounting for more feelings.
