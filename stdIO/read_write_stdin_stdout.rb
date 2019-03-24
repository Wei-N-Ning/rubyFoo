def prompt_user_input
  print 'numbers (v1 v2): '
  STDOUT.flush
  str = gets
  exit if str.nil? || str.empty?

  # recap in udemy compr ruby prog
  str.chomp!
  
  v1, v2 = str.split(' ')
  # exitcode 1
  abort "#{v1} is not a num" if v1 !~ /-?\d+/
  v1 = v1.to_f
  print "#{v2}: #{v1}"
end

# source: udemy compr ruby prog, section 2 lecture 6
# puts() returns nil
# p() returns the value printed
# 
# puts iterate the given array and puts each element;
# p print the stringified array
def p_and_puts
  puts(puts('there is a cow'))
  puts(p('there is a cow'))
end

prompt_user_input
p_and_puts
