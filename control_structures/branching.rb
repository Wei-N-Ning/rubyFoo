def compare_str_with_regex
  case 'there is acow'
  when /cow\b/
    print 'any cow'
  end
end

compare_str_with_regex
