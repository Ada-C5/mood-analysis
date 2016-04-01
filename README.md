# Mood Analysis: Hash Practice
Let's practice interacting with Hashes (key-value pairings) by writing a program that creates hashes, stores data in hashes, retrieves data from hashes, and prints the contents of a hash.

## mood-analysis.rb
Take a look at [mood-analysis.rb](mood-analysis.rb).

### What's Happening?
Explain what is happening on each of the following lines in the code.

| Line # | What's happening?
|:------:|-------------------
| 1      | Establish hash called FEELINGS
| 2      | Establish key happy with array of "happy" strings
| 3      | Establish key sad with array of "sad" strings
| 6      | Establish method called analyze_mood that requires (words)
| 7-8    | Establish happy variable as 0, Establish sad variable as 0
| 9      | takes words and transforms into lower case
| 10     | Split words apart (by their spaces) and put in an array. Then look at each word and do...
| 11     | if the word being looked at is in the Feelings:happy key...
| 12     | add one to the happy variable.
| 13     |if the word being looked at is in the Feelings:sad key...
| 14     | add 1 to the sad variable.
| 17-19  | return a smiley face if the happy variable is > than sad, a sad face if sad is > happy or a neutral face if they are equal.

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
| Why do we need line 9? | All words analyzed need to be lower case so that they will match the words in FEELINGS.
| What is the relationship between `words` and `word` (line 10)? | words is the name of the string that was input with the method. word is the given variable name that will identify each particular word as it goes through the .each loop
| Why doesn't line 19 have an associated if/condition? | It doesn't need to because there are only three possible outcomes (>, < or =). Because > and < were already defined, the last possibility has to be =.
| What is the relationship between `text[0]`, `text[1]`, and `words`? | Text0 is the first item in the text array. Text1 is the second item in the text array. words is the placeholder variable for whatever argument is given to the method, which in this case will be either text[0] or text[1].

### Assignment: Requirements
1. Replace lines 31 and 32 and write a loop to print out each day and the emoticon that is associated by analyzing the mood of that day.

Your result will look like:
```
03/01  :-(
03/13  :-|
...
```

**think**: Why does 03/13 come out as _sad_ when it should be _happy_? How could we fix this?
It does not count yay as a happy word because the exclamation point at the end of the string is not removed. Since "yay!" != "yay", it is not counted. We could fix this by including words.delete! "!", ".", ","

2. To make the results a little more accurate, let's write and utilize a method called `strip_punctuation` to strip out the punctuation that affects the results. Namely, remove  exclamation marks (!), periods (.), commas (,), and hashtags (#).

Your method should take a string as an argument and return the string without the above mentioned punctuation.

After writing this method, our new result should be:
```
03/01  :-(
03/13  :-)
...
```

**think**: Where should we call `strip_punctuation`? Does it matter? Why?
I think we should call strip_punctuation inside of the analyze_mood method, anytime before the .each loop so the loop doesn't analyze any words that still have the punctuation attached.

3. Write a method called `happy_days` to determine how many logged entries it takes until there have been three :-) happy days.

Your output could be something like:
```
It takes 5 entries for 3 happy days to occur
```

**think**: What are you going to do if there aren't at least 3 happy days? Where do you need to handle that case?
See my code for how I handled this case. If the happy_days method did not produce at least three :-)s when analyzing the text, then a different value is returned.

4. Write a method called `overall_mood` to determine the most common mood across all logged entries.

Your output could be something like:
```
The most common mood is :-)
```

**think**: Should you use an array or a hash to solve this problem? Why?
I used an array, however I think you could use a hash just as well. I chose an array so I could use enumerable methods on it, and I could not think of a reason why key-value pairs would be neccessary.

**think**: What if we eventually want to add feelings to our analysis? Can we write this code in a way that will prevent us from having to re-write it later?
The overall_mood method can be rewritten to use another method instead of analyze_mood. So a new method called analyze_feelings, for example, could replace analyze_mood in this method. I don't know if I understand what this question is asking.
