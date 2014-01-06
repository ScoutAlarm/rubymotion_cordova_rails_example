class CustomPlugin < CDVPlugin

  def foo(command)
    puts "foo was called by from javascript!"
  end
end