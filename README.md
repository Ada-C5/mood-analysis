# Mood Analysis: Hash Practice
Let's practice interacting with Hashes (key-value pairings) by writing a program that creates hashes, stores data in hashes, retrieves data from hashes, and prints the contents of a hash.

## mood-analysis.rb
Take a look at [mood-analysis.rb](mood-analysis.rb).

### What's Happening?
Explain what is happening on each of the following lines in the code.

| Line # | What's happening?
|:------:|-------------------
| 1      |create a constant called FEELINGS
| 2      |creates the first element of the hash with a key
          value of "happy". using the literal %w it creates
          an array
| 3      |creates the second element of the hash with a key
          value of "sad". using the literal %w it creates
          an array
| 6      |creates a method called analyze_mood that accepts
          one argument called words
| 7-8    |sets two local variables happy and sad with a value of 0
| 9      |changes the string value of words to downcase
| 10     |creates an array using the split method
          and using the each method to go through each word in a loop
| 11     |using keyword if, checks if the constant FEELINGS[:happy]
          includes the word passed in the array
| 12     |happy adds a 1 to the
        exiting  value of itself using a literal
| 13     |if the first condition of the if statement is false, then
          the second condition, elsif, FEELING[:sad], checks to see if the word is included?
| 14     |1 to the exiting value of sad
| 17-19  |using the values of happy and sad the condition checks
          see what emoji to return

### Data Types
What's the Data Type of the following?

| Code                       | Data Type
|----------------------------|-----------
| FEELINGS                   |hash
| :sad                       |symbol
| happy                      |fixnum
| words                      |string
| words.split(" ")           |array
| FEELINGS[:sad]             |array
| FEELINGS[:happy].include?  |true class or false class
                              (there is no boolean class)
| analyze_mood(text)         |string

### Explaining the Code
| Question               | Answer
|------------------------|-------
| Why do we need line 9? | we want to check the values of the words to see if it matches the words in the feelings array so we want to downcase to match it. Ruby, when matching strings is case-sensitive.

| What is the relationship between `words` and `word` (line 10)? |
word is an element in the words array being looped through using the each method

| Why doesn't line 19 have an associated if/condition? |
because it is the last remaining condition so you don't need to
state it.

| What is the relationship between `text[0]`, `text[1]`, and `words`? |

 Text[0]...text[3] are the parameters being passed to the words argument.  

### Assignment: Requirements
1. Replace lines 31 and 32 and write a loop to print out each day and the emoticon that is associated by analyzing the mood of that day.

Your result will look like:
```
03/01  :-(
03/13  :-|
...
```

**think**: Why does 03/13 come out as _neutral_ when it should be _happy_? How could we fix this?
By removing the punctuation from text.

because the text includes mode from the date before and the word great includes "!"

2. To make the results a little more accurate, let's write and utilize a method called `strip_punctuation` to strip out the punctuation that affects the results. Namely, remove  exclamation marks (!), periods (.), commas (,), and hashtags (#).

Your method should take a string as an argument and return the string without the above mentioned punctuation.

After writing this method, our new result should be:
```
03/01  :-(
03/13  :-)
...
```

**think**: Where should we call `strip_punctuation`? Does it matter? Why?

I didn't use a method, instead I used gsub! method and regex to extract the punctuation and transform the variable. If I were to call it, I would call it in the analyze_mood method before splitting the word into an array.

3. Write a method called `happy_days` to determine how many logged entries it takes until there have been three :-) happy days.

Your output could be something like:
```
It takes 5 entries for 3 happy days to occur
```

**think**: What are you going to do if there aren't at least 3 happy days? Where do you need to handle that case?

I'm using a ternary operator to determine whether or not there are at least three happy_days in the happy_days(result) method before returning the result to the user. This way the output is already adjusted in the text. Instead of having the checking it outside of the method, as I had previously.


4. Write a method called `overall_mood` to determine the most common mood across all logged entries.

Your output could be something like:
```
The most common mood is :-)
```

**think**: Should you use an array or a hash to solve this problem? Why?

At first, I used an array and realized that a hash would be an easier way of handling the problem. Hashes make sense because we are evaluating the values of strings and incrementing each occurrence and order is not important. Therefore, we can set the different string values as keys and increment the value of each key.

**think**: What if we eventually want to add feelings to our analysis? Can we write this code in a way that will prevent us from having to re-write it later?

Yeah, we can write a separate method that analyzes feelings. We can also use the results from the analyze_mood, happy_days(results) and overall_mood(result) to help determine the feeling of each journal entry. 
