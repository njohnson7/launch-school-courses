def nth_fib(n, a = 1, b = 1, idx = 2)
  idx >= n ? (return b) : nth_fib(n, b, a + b, idx + 1)
end

p (1..100).map { |n| nth_fib(n) }
p nth_fib(9361) # maximum it can calculate before raising a SystemStackError
