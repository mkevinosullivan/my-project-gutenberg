# Project Gutenberg (Intro to Ruby Assignment)

## Write a function that takes in a string representing a filename and returns a processed version of the text file.
Read the file and store it in a string. Strip any whitespace before and after the text. Remove any newlines between lines of text that don't correspond to paragraph breaks (these were originally added for readability). Return the resulting text. Be sure to use the result of this function as input to your other functions.
- [x] Completed?
  - `read_book()`

## Write a function that takes your book text and a hash of string keys and string values.
It will return a modified version of the input text. The hash you provide the function will have keys that represent words or phrases you want to replace in the text, and values that represent what to replace the words or phrases with. To use the function, create a copy of the input text, and search-and-replace using the input hash on the copy (are regular expressions useful here?). Return the result. Be creative when testing this one! As an example, you might try changing characters' names or locations in the story.
- [x] Completed?
  - `modify_text()`

## Write a set of functions that analyze your book text in some way.
The function should take the text as input, and, if applicable, a hash representing a set of options used to customize the analysis. You get to decide  how you will analyze the text, and whether you need any options (try to make at least one function with options, though!). Regular expressions, possibly including matching groups, might be useful here. Some ideas:
- How many times are particular words or phrases used?
- How many sentences follow a particular sentence structure? What are the sentences?
- Can you find some words that might be verbs, nouns, or adjectives based on where they appear in a sentence, or how they are written (e.g. ending in "ed")?


- [x] Completed?
  - `word_count()`
  - `paragraph_count()`
  - `phrase_analysis()`

## Write a function that takes your book text and writes a modified HTML version to a file.
Make a copy of your text and add various HTML tags like `<p></p>` around the paragraphs and maybe some anchor links for a table of contents. What other HTML tags could you add?
- [ ] Completed?
