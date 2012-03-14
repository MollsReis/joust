class Handler

  def subtract(a, b)
    a - b
  end

  def subtract_named(a)
    a['minuend'] - a['subtrahend']
  end

  def update(a, b, c, d, e) end

  def foobar; end

  def sum(a, b, c)
    a + b + c
  end

  def notify_hello(a) end

  def get_data
    ['hello', 5]
  end

  def notify_sum(a, b, c) end

end