require 'minitest/autorun'

  #Exercise 1
  assert(value.odd?), 'value is not odd'
  #Exercise 2
  assert_equal('xyz', value.downcase)
  #Exercise 3
  assert_nil(value)
  #Exercise 4
  assert_empty(list)
  #Exercise 5
  assert_includes(list, 'xyz')
  #Exercise 6
  assert_raises NoExperienceError do 
    employee.hire
  end
  #Exercise 7
  assert_instance_of(Numeric, value)
  #Exercise 8
  assert_kind_of(Numeric, value)
  #Exercise 9
  assert_same(list, list.process)
  #Exercise 10
  refute_includes(list, 'xyz')
  

end