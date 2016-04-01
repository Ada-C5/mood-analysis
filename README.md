# Mood Analysis: Hash Practice
Let's practice interacting with Hashes (key-value pairings) by writing a program that creates hashes, stores data in hashes, retrieves data from hashes, and prints the contents of a hash.

## mood-analysis.rb
Take a look at [mood-analysis.rb](mood-analysis.rb).

### What's Happening?
Explain what is happening on each of the following lines in the code.

| Line # | What's happening?
|:------:|-------------------
| 1      | declaring constant FEELINGS
| 2      | assigning key-value pairs in hash, using literal for the value that generates an array of strings. key :happy
| 3      | (see above) key :sad
| 6      | defining method analyze_mood with argument (words)
| 7-8    | assigning value of 0 to variable happy, assigning value of 0 to variable sad
| 9      | putting words into lower case
| 10     | applying .split to text words to get array of single words, then initiating .each loop
| 11     | comparing the word to the words in the value array of :happy
| 12     | redefine happy variable as happy + 1
| 13     | elsif condition comparing the word to words in value array of :sad
| 14     | redefine sad variable as sad + 1
| 17-19  | evaluating values of happy and sad variables and returning strings depending on outcome of evaluation

### Data Types
What's the Data Type of the following?

| Code                       | Data Type
|----------------------------|-----------
| FEELINGS                   | hash
| :sad                       | symbol
| happy                      | fixnum
| words                      | string
| words.split(" ")           | array of strings
| FEELINGS[:sad]             | array (say, "FEELINGS at sad")
| FEELINGS[:happy].include?  | boolean
| analyze_mood(text)         | string

### Explaining the Code
| Question               | Answer
|------------------------|-------
| Why do we need line 9? | .include? method is case-sensitive

| What is the relationship between `words` and `word` (line 10)? | "words" is the array of words submitted as text by the user. "word" is each member of that array, or an individual word/string.

| Why doesn't line 19 have an associated if/condition? | it doesn't need one, because the two evaluations will return only true or false, so if neither of those is returned, the code automatically progresses to the final return.

| What is the relationship between `text[0]`, `text[1]`, and `words`? |
"text[0]" and "text[1]" are the arguments passed into analyze_mood. Within that method, they will be labeled as "words".

### Assignment: Requirements
1. Replace lines 31 and 32 and write a loop to print out each day and the emoticon that is associated by analyzing the mood of that day.

Your result will look like:
```
03/01  :-(
03/13  :-|
...
```



**think**: Why does 03/13 come out as _neutral_ when it should be _happy_? How could we fix this?
It comes out as neutral because .split is creating an array of items divided by spaces. It is including punctuation in each item where it appears next to a word. We need to take the punctuation out, because the happy and sad arrays contain no punctuation.

2. To make the results a little more accurate, let's write and utilize a method called `strip_punctuation` to strip out the punctuation that affects the results. Namely, remove  exclamation marks (!), periods (.), commas (,), and hashtags (#).

Your method should take a string as an argument and return the string without the above mentioned punctuation.

After writing this method, our new result should be:
```
03/01  :-(
03/13  :-)
...
```

**think**: Where should we call `strip_punctuation`? Does it matter? Why?
I called in within the loop where I am asking it to return the date and resulting string, because it has to be called on a string, not an array of strings, and this is where I was already destructuring the array of strings.

3. Write a method called `happy_days` to determine how many logged entries it takes until there have been three :-) happy days.

Your output could be something like:
```
It takes 5 entries for 3 happy days to occur
```

**think**: What are you going to do if there aren't at least 3 happy days? Where do you need to handle that case?
I would add an if statement like "if entries.length == no_of_days, puts 'this period didn't have three happy days.'"

4. Write a method called `overall_mood` to determine the most common mood across all logged entries.

Your output could be something like:
```
The most common mood is :-)
```

**think**: Should you use an array or a hash to solve this problem? Why?
Because we were simply tallying the data and not trying to find specific days, I used an array to count the happy and sad days. I stored the dates of the happy and sad results instead of just tallying how many there were because it seemed like a useful piece of data to be able to access (which days were sad, which were happy, would be easy to access).

**think**: What if we eventually want to add feelings to our analysis? Can we write this code in a way that will prevent us from having to re-write it later?
I was thinking about storing the happy and sad arrays and their length in a hash of feelings, like { happy: happy.length, sad: sad.length}, and then doing a .sort_by method on the hash to find the most common one. That would be a refactor that would allow you to add more emotions with more ease.
