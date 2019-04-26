#!/usr/bin/env ruby

# source: ruby way 3rd P148/1832

# A byte is 8 bits - no i18n context

# A codepoint is a single entry in the imaginary table that 
#   represents the character set. As a half-truth, you may think
#   of a codepoint as mapping one-to-one to a character. Near to 
#   the truth, it sometimes takes more than a single codepoint 
#   to uniquely specify a character

# a glyph is the visual representation of a codepoint. A character's 
#   identity is distinct from its visual repr

# a grapheme is similar to the concept of a glyph, but when we 
#   talk about graphemes, we are coming from the context of the 
#   language, not the context of our software. 
#   A grapheme may be the combination (naive of otherwise) of 
#   two of more glyphs. It's the way a user thinks about a 
#   character in his own native language context.

# unicode codepoints notation: U+ followed by four or more 
# uppercase hex digits
# e.g. letter A is U+0041

def inspect_single_letter(letter:)
  breakdown = {
    length: letter.length,
    bytes: letter.bytes,
    num_bytes: letter.bytes.length
  }
  p breakdown
end

def inspect_multiple_letters(letters:)
  breakdown = []
  letters.each_char.with_index do |letter, index|
    breakdown.push(
      index: index,
      length: letter.length,
      bytes: letter.bytes,
      codepoints: letter.codepoints
    )
  end
  puts breakdown
end

def main
  inspect_single_letter(letter: "\u0041")
  inspect_single_letter(letter: "\u00E9p")
  inspect_multiple_letters(letters: "\u00E9p\u00E9e")
end

main
