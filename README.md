# Mood Analysis: Hash Practice
Let's practice interacting with Hashes (key-value pairings) by writing a program that creates hashes, stores data in hashes, retrieves data from hashes, and prints the contents of a hash.

## mood-analysis.rb
Take a look at [mood-analysis.rb](mood-analysis.rb).

### What's Happening?
Explain what is happening on each of the following lines in the code.

| Line # | What's happening?
|:------:|-------------------
| 1      | defining a constant variable to contain a hash
| 2      | setting the key happy to contain an array of strings of happy words
| 3      | setting the key sad to contain an array of strings of sad words
| 6      | defining a method (the method signature)
| 7-8    | setting local variables which will hold counts
| 9      | downcasing (making all lowercase) the argument passed to the method (! mean's its mutated)
| 10     | splitting the passed argument into individual words so they can be tested (they form an array) and iterating over them.
| 11     | testing if the happy words contain the word being tested in the loop
| 12     | adding one to the happy count
| 13     | testing if the sad words contain the current word
| 14     | adding one to the sad count
| 17-19  | returning a smiley based on which count is highest

### Data Types
What's the Data Type of the following?

| Code                       | Data Type
|----------------------------|-----------
| FEELINGS                   | hash of arrays
| :sad                       | array
| happy                      | fixnum
| words                      | string
| words.split(" ")           | array of strings
| FEELINGS[:sad]             | array of strings
| FEELINGS[:happy].include?  | boolean
| analyze_mood(text)         | string

### Explaining the Code
| Question               | Answer
|------------------------|-------
| Why do we need line 9? | to standardize the data so it can be tested, since all the words to validate against are downcased
| What is the relationship between `words` and `word` (line 10)? | words is the string that gets split to make an array, word is the iteration variable that calls each individual word in words
| Why doesn't line 19 have an associated if/condition? | it will return in any case where line 17 or 18 isn't true, it's an implied condition.
| What is the relationship between `text[0]`, `text[1]`, and `words`? | each text[index] is processed as words

### Assignment: Requirements
1. Replace lines 31 and 32 and write a loop to print out each day and the emoticon that is associated by analyzing the mood of that day.

Your result will look like:
```
03/01  :-(
03/13  :-|
...
```

**think**: Why does 03/13 come out as _sad_ when it should be _happy_? How could we fix this?

It's not recognizing the good words because `include?` in `#analyze_mood` tests if there's a perfect match. We need to strip out interfering punctuation (while leaving the slash in the date).

2. To make the results a little more accurate, let's write and utilize a method called `strip_punctuation` to strip out the punctuation that affects the results. Namely, remove  exclamation marks (!), periods (.), commas (,), and hashtags (#).

Your method should take a string as an argument and return the string without the above mentioned punctuation.

After writing this method, our new result should be:
```
03/01  :-(
03/13  :-)
...
```

**think**: Where should we call `strip_punctuation`? Does it matter? Why?

I chose to call it in `#print_all_moods` because it only needs to modify the local copy that the method uses. However, since I want `#print_all_moods` to do something with the modified data, I put it outside the loop that would analyze the strings. 

This usage also seems in keeping with the idea that we should do our best to call methods and not data, as per our discussions about the Metz book. (Rather than trusting a second variable is reliable, and storing the result of `#strip_punctuation` in it, I am calling the method directly on the data to be analyzed. I hope I'm expressing myself.)

3. Write a method called `happy_days` to determine how many logged entries it takes until there have been three :-) happy days.

Your output could be something like:
```
It takes 5 entries for 3 happy days to occur
```

**think**: What are you going to do if there aren't at least 3 happy days? Where do you need to handle that case?

I check the happy days iteration variable after the iteration is finished, and deliver a message that 3 happy days didn't exist if the whole loop doesn't deliver 3 happy days. This seems to be the least resource consuming way to check if 3 happy days happen.

4. Write a method called `overall_mood` to determine the most common mood across all logged entries.

Your output could be something like:
```
The most common mood is :-)
```

**think**: Should you use an array or a hash to solve this problem? Why?

I used a hash of arrays because I wanted to access collected values by total, and this way I can call a key to see which one holds the most values.

**think**: What if we eventually want to add feelings to our analysis? Can we write this code in a way that will prevent us from having to re-write it later?

I *believe* I have written code that will allow me to simply slot in more moods and smileys and then continue to run as is.
