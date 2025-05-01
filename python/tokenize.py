# Imports
#import os
#import nltk
#from nltk.corpus import wordnet as wn

#wn.synset('acquit.v.01').lemmas()

# For every lem in one of the synsets, isolate just the names without the extra stuff:
#for lem in wn.synset('acquit.v.01').lemmas():
    #print(lem.name())

# Here we'll just return the count of the available lemmas for each synset for "clear"
# In this output we're just surveying the data as lists:
#for synset in wn.synsets('clear'):
    #print(synset, ": ", synset.lemma_names(), ": ", len(synset.lemma_names()))

# Ask for the definitions and part of speech available for a word lemma names in WordNet
#for synset in wn.synsets('clear'):
    #print(synset.lemma_names(), ": Part of Speech: ", synset.pos(), ": Definition: ", synset.definition())

#wn.morphy('cries')





import nltk
from nltk.tokenize import word_tokenize
from nltk.tag import pos_tag

filepath = '../source/vol-4.txt'
f = open(filepath, 'r', encoding='utf8').read()
# Make a list of tokens in your text.
# tokenList = f.split()
tokenList = word_tokenize(f)
# How is NLTK's word_tokenize() different from just splitting on spaces? Here's an example of how it's different:
# Look for "don't" in the output of this cell and see how it's split.
print(tokenList)

# Reduce the complexity by: 1) lowercasing them, and 2) returning the set() of words (remove multiple of the same value)
lowercaseTokens = [token.lower() for token in tokenList]
uniqueTokens = set(lowercaseTokens)
print(uniqueTokens)

nltk.help.upenn_tagset('NNS')

POStagged = pos_tag(uniqueTokens)
tagsIwant = ['VB', 'VBZ']
# This is a Python list comprehension that'll help us with our list of tuples [(word, tag), (word, tag), ...]
shortList = [word for word, tag in POStagged if tag in tagsIwant]
print(len(shortList))
print(shortList)

# Fancy string formatting (not super useful here, just reviewing it):
# f'My short list is {shortList} and it is this long: {len(shortList)}'
