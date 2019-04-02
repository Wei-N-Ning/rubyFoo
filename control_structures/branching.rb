
# ??? default case ???
def compare_str_with_regex(text)
  case text
  when /cow\b/
    puts 'any cow'
  when /\bdoom\b/
    puts 'doom'
  end
end

def main
  compare_str_with_regex('there is a cow')
  compare_str_with_regex('')
end

main
