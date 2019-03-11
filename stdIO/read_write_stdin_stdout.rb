def prompt_user_input
  print 'numbers (v1 v2): '
  STDOUT.flush
  str = gets
  exit if str.nil? || str.empty?
  str.chomp!
  v1, v2 = str.split(' ')
  # exitcode 1
  abort "#{v1} is not a num" if v1 !~ /-?\d+/
  v1 = v1.to_f
  print "#{v2}: #{v1}"
end

prompt_user_input
