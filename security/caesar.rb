
def main
  text = '2343c28bace4ff848b5c0e9d136a149de5bc4be9'
  code = text.bytes.map{|c|c-13}.pack('c*')
  # code is "%&'&V%+UTVX'YY+'+U(V#X,W$&)T$',WX(UV'UX,"
  p code.bytes.map{|c|c+13}.pack('c*') == text
end

main