# Mood Analysis: Hash Practice
Let's practice interacting with Hashes (key-value pairings) by writing a program that creates hashes, stores data in hashes, retrieves data from hashes, and prints the contents of a hash.

## mood-analysis.rb
Take a look at [mood-analysis.rb](mood-analysis.rb).

### What's Happening?
Explain what is happening on each of the following lines in the code.

| Line # | What's happening?
|:------:|-------------------
| 1      | constant variable
| 2      | first part of constant assignment; hash key/value pair, value is array literal
| 3      | second key value pair in constant assignment, value is array literal
| 6      | method signature - method name + argument that it takes (words)
| 7-8    | two local variables being assigned the value 0
| 9      | takes the words passed into the method and makes them all lowercase
| 10     | takes words and splits them by space, puts them into array, then iterates over
           each word in the array.
| 11     | check if word being iterated over is included in the constant variable's value of
           key :happy
| 12     | increase the value of the local variable happy by 1.
| 13     | check if word being iterated over is included in the constant variable's value of
          key :sad
| 14     | increase the value of the local variable sad by 1.
| 17-19  | after iterating through all words, if counter of local var happy is greater than
           value of local variable sad, return the smiley face. If value of sad is greater than value of happy, return the sad face. If the values are equal to one another, return neutral face.

### Data Types
What's the Data Type of the following?

| Code                       | Data Type
|----------------------------|-----------
| FEELINGS                   | hash
| :sad                       | symbol
| happy                      | fixnum
| words                      | string
| words.split(" ")           | array
| FEELINGS[:sad]             | array literal
| FEELINGS[:happy].include?  | boolean
| analyze_mood(text)         | string

### Explaining the Code
| Question               | Answer
|------------------------|-------
| Why do we need line 9? | so the data is consistent and will match the words in the constant
| What is the relationship between `words` and `word` (line 10)? | word is one element of the words array
| Why doesn't line 19 have an associated if/condition? | Because it's what is returned if the values are equal
| What is the relationship between `text[0]`, `text[1]`, and `words`? | text is analyzing each row/string of words, which is passed in to the method

### Assignment: Requirements
1. Replace lines 31 and 32 and write a loop to print out each day and the emoticon that is associated by analyzing the mood of that day.

Your result will look like:
```
03/01  :-(
03/13  :-|
...
```

**think**: Why does 03/13 come out as _sad_ when it should be _happy_? How could we fix this?

Because "Yay!" has an exclamation point on it, and that doesn't match the word in the constant

2. To make the results a little more accurate, let's write and utilize a method called `strip_punctuation` to strip out the punctuation that affects the results. Namely, remove  exclamation marks (!), periods (.), commas (,), and hashtags (#).

Your method should take a string as an argument and return the string without the above mentioned punctuation.

After writing this method, our new result should be:
```
03/01  :-(
03/13  :-)
...
```

**think**: Where should we call `strip_punctuation`? Does it matter? Why?

The strip_punctuation method should be called before the loop, because we want to remove punctuation before we add to the values of happy or sad variables. It could technically be put anywhere before the loop though.

3. Write a method called `happy_days` to determine how many logged entries it takes until there have been three :-) happy days.

Your output could be something like:
```
It takes 5 entries for 3 happy days to occur
```

**think**: What are you going to do if there aren't at least 3 happy days? Where do you need to handle that case?

I fixed my loop to break when happy_faces variable has the value of 3, then modified the conditional at the end to return that there aren't enough happy days if happy_faces doesn't equal 3.

4. Write a method called `overall_mood` to determine the most common mood across all logged entries.

Your output could be something like:
```
The most common mood is :-)
```

**think**: Should you use an array or a hash to solve this problem? Why?

I feel like using an array is easier to push the result of analyze_mood into it, then just calculate the length of the arrays.

**think**: What if we eventually want to add feelings to our analysis? Can we write this code in a way that will prevent us from having to re-write it later?

We could probably put the emotion faces into constants and use them throughout the methods. 
