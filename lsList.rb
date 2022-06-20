
  def list_number
    n = 3.0
    count = (Dir.children(".").size.to_f/n).ceil
    count.to_i
  end
  def ls_list(c)
    n = 3.0
    list = []
    Dir.each_child(".") {|item| list << item}
    slice_list = list.each_slice(n).to_a
    slice_list[0].zip(slice_list[1],slice_list[2]) { |ary| p ary }
    puts
    print (list[0] + "　　　　　" + list [0+n] + "　　　　　" + list[0+n+n]).ljust(2)
    puts ""
    print (list[1] + "　　　　" + list [1+n] + "　　　 " + list[1+n+n]).ljust(2)
    puts ""
    print (list[2] + "　　　　　" + list [2+n]).ljust(2)
    puts ""    
  end
  puts ls_list(list_number)
