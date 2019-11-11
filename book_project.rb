# Write a function that takes in a string representing a filename and returns a processed version of
# the text file. Read the file and store it in a string. Strip any whitespace before and after the
# text. Remove any newlines between lines of text that don't correspond to paragraph breaks (these
# were originally added for readability). Return the resulting text. Be sure to use the result of
# this function as input to your other functions.

def read_book(filename)
    contents = File.read(filename)

    # remove leading and trailing whitespace
    contents.strip!
    # DEBUG puts contents
    # DEBUG puts "============================================"

    # DEBUG p contents
    # for newlines ('\n') not followed by a space, assuming it's a continuing paragraph
    # and merge it together
    regex = /(\S)\n(\S)/
    contents = contents.gsub(regex, '\1 \2')
end


# Write a function that takes your book text and a hash of string keys and string values.
# It will return a modified version of the input text. The hash you provide the function
# will have keys that represent words or phrases you want to replace in the text, and
# values that represent what to replace the words or phrases with. To use the function,
# create a copy of the input text, and search-and-replace using the input hash on the copy
# (are regular expressions useful here?). Return the result. Be creative when testing this
# one! As an example, you might try changing characters' names or locations in the story.

def modify_text(book_text, string_values)
    string_values.each do |search_string, change_string|
        regex = %r[#{search_string}]
        book_text = book_text.gsub(regex, change_string)
    end

    return book_text
end


# Write a set of functions that analyze your book text in some way. The function should take
# the text as input, and, if applicable, a hash representing a set of options used to customize
# the analysis. You get to decide  how you will analyze the text, and whether you need any
# options (try to make at least one function with options, though!). Regular expressions,
# possibly including matching groups, might be useful here. Some ideas:

# - How many times are particular words or phrases used?
# - How many sentences follow a particular sentence structure? What are the sentences?
# - Can you find some words that might be verbs, nouns, or adjectives based on where they appear
#   in a sentence, or how they are written (e.g. ending in "ed")?


def word_count(book_text)
    count = 0
    book_text.split(/[^-a-zA-Z']/).each do |word|
        count += 1 if word.length > 0
        # DEBUG puts count.to_s + ': "' + word + '"'
    end
    return count
end

def paragraph_count(book_text)
    # NEEDS TO BE TIGHTENED UP, TO IGNORE TITLE, TOC, ETC.
    # assumes paragraphs are delimited by '\n\n' at the end of them
    # DEBUG puts book_text.scan(/\S\n\n\S/)
    return book_text.scan(/\S\n\n\S/).size
end

def phrase_analysis(book_text, phrases)
    phrases.each do |phrase|
        adjusted_phrase = '\b' + phrase + '\b'
        regex = %r[#{adjusted_phrase}]
        puts 'Phrase "' + phrase + '": ' + book_text.scan(regex).size.to_s
    end
end


# Write a function that takes your book text and writes a modified HTML version to a
# file. Make a copy of your text and add various HTML tags like <p></p> around the
# paragraphs and maybe some anchor links for a table of contents. What other HTML
# tags could you add?
# TODO


### START

book_text = read_book("Andersens_Fairy_Tales-reduced.txt")

change_strings = {
    "Emperor" => "King",
    "clothes" => "underwear",
    "weavers" => "conmen"
}

puts "=========================="
puts modify_text(book_text, change_strings)

# DEBUG puts book_text
puts "=========================="
puts "There are " + word_count(book_text).to_s + " words in the book."
puts "There are " + paragraph_count(book_text).to_s + " paragraphs in the book."

phrases = [
    "the Emperor",
    "the"
]
puts "=========================="
phrase_analysis(book_text, phrases)
