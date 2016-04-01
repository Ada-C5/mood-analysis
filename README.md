# Mood Analysis: Hash Practice
Let's practice interacting with Hashes (key-value pairings) by writing a program that creates hashes, stores data in hashes, retrieves data from hashes, and prints the contents of a hash.

## mood-analysis.rb
Take a look at [mood-analysis.rb](mood-analysis.rb).

### What's Happening?
Explain what is happening on each of the following lines in the code.

| Line # | What's happening?
|:------:|-------------------
| 1      | Creates a hash constant to keep track of which words are correlated to each emotion
| 2      | Decides that the given array of positive words are represented by the key :happy
| 3      | Decides that the given array of negative words are represented by the key :sad
| 6      | Creates a method which uses the words passed into it to analyze the person's mood
| 7-8    | Sets the person's initial happiness and sadness to zero
| 9      | Mutates the value of the words that are passed in so that they are all in lower-case, so the program can understand them
| 10     | Separates each of the words in the given text according to where the space-character is, then turns those words into an array so they can be iterated through, then executes the next code on each word in that array
| 11     | Checks to see if that word is a member of the array that is a value of the :happy key in FEELINGS
| 12     | increases the happy score
| 13     | otherwise check to see if that word is included in the array that is a value of the :sad key in FEELINGS
| 14     | increases the sad score
| 17-19  | returns a smiley-face if the happy score is highest, a frowney-face if the sad score is highest; otherwise returns a deadpan face

### Data Types
What's the Data Type of the following?

| Code                       | Data Type
|----------------------------|-----------
| FEELINGS                   | hash
| :sad                       | symbol
| happy                      | fixnum
| words                      | string
| words.split(" ")           | array
| FEELINGS[:sad]             | array
| FEELINGS[:happy].include?  | boolean
| analyze_mood(text)         | string

### Explaining the Code
| Question               | Answer
|------------------------|-------
| Why do we need line 9? | otherwise capital letters won't match the "include?" requirement
| What is the relationship between `words` and `word` (line 10)? | word is each element of the array formed by splitting    words
| Why doesn't line 19 have an associated if/condition? | because it is the result that happens in any condition where the :-) and :-( don't return
| What is the relationship between `text[0]`, `text[1]`, and `words`? | words is the argument for the method, it can be whatever is passed into it; in this case, the first value of the text array (text[0]) is passed in, then the second value (text[1])

### Assignment: Requirements
1. Replace lines 31 and 32 and write a loop to print out each day and the emoticon that is associated by analyzing the mood of that day.

Your result will look like:
```
03/01  :-(
03/13  :-|
...
```

**think**: Why does 03/13 come out as _neutral_ when it should be _happy_? How could we fix this?
Because the tweet contains both "horrible" and "great", and it isn't reading "yay" because the .split(" ") makes it include the exclamation point.

2. To make the results a little more accurate, let's write and utilize a method called `strip_punctuation` to strip out the punctuation that affects the results. Namely, remove  exclamation marks (!), periods (.), commas (,), and hashtags (#).

Your method should take a string as an argument and return the string without the above mentioned punctuation.

After writing this method, our new result should be:
```
03/01  :-(
03/13  :-)
...
```

**think**: Where should we call `strip_punctuation`? Does it matter? Why?
strip_punctuation has to be called before analyze_mood starts checking if certain words are included, otherwise the punctuation will be included in that check. So I put it inside the parameter I passed to analyze_mood, that way "words" wouldn't get there without passing through the strip_punctuation method.

3. Write a method called `happy_days` to determine how many logged entries it takes until there have been three :-) happy days.

Your output could be something like:
```
It takes 5 entries for 3 happy days to occur
```

**think**: What are you going to do if there aren't at least 3 happy days? Where do you need to handle that case?
I used an if-statement to make it so the method's return value is dependent on the number of happy days, at the end of the happy-days method just before it returns it. Anything less than 3 happy days is covered in the "else" statement.

4. Write a method called `overall_mood` to determine the most common mood across all logged entries.

Your output could be something like:
```
The most common mood is :-)
```

**think**: Should you use an array or a hash to solve this problem? Why?

**think**: What if we eventually want to add feelings to our analysis? Can we write this code in a way that will prevent us from having to re-write it later?
