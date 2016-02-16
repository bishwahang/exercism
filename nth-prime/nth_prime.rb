#!/usr/bin/env ruby
# encoding: utf-8
class NthPrime
  # set the value of N as required to maximum
  N = 200_000

  attr_reader :is_prime
  def self.nth(n)
    raise ArgumentError if n == 0
    prime = self.new
    prime.get_results(n)
  end

  def initialize
    @is_prime =  Array.new(N, true)
    get_primes
  end

  def is_prime?(n)
    @is_prime[n]
  end

  def false_prime(n)
    @is_prime[n] = false
  end

  def get_primes
    # make 0 and 1 index false
    false_prime(0)
    false_prime(1)

    # use sieve theorem
    (2..N).step(1) do |i|
      break if i * i >= N
      if is_prime? i
        (i..N).step(1) do |j|
          break if i * j >= N
          false_prime(i*j)
        end
      end
    end
  end

  def get_results(n)
    count = 0
    is_prime.each_with_index do |val,index|
      next if index == 0
      count += 1 if val
      # return the nth prime
      return index if count == n
    end
    # change the value of constant N if it doesnot meet in test range
    raise ArgumentError, 'Argument is too large. change the value of N'
  end
end

class Prime
  def self.nth(n)
    NthPrime.nth(n)
  end
end
