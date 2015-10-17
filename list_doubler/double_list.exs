# double_list.exs

random_list = fn n ->
  :erlang.binary_to_list :crypto.rand_bytes(n)
end

myList = random_list.(10)

IO.puts "my list:"
IO.inspect myList

defmodule ListDoubler do

  # entry point: provides empty accumulator to list_doubler/2
  def double(list) do
    list_doubler(list, [])
  end

  # base case:
  # empty input list has no elements that need doubling
  # put accumulator in right order and ship it
  defp list_doubler([], accum) do
    Enum.reverse accum
  end

  # recursive case:
  # double first element, stick it to the start of the accumulator
  defp list_doubler([first | rest], accum) do
    list_doubler(rest, [first * 2 | accum])
  end
end

IO.puts "doubled with ListDoubler:"
IO.inspect ListDoubler.double myList

doubledWithComprehension = for n <- myList, do: n * 2
alsoDoubledWithComprehension = for n <- myList do
  n * 2
end

IO.puts "doubled with comprehension:"
IO.inspect doubledWithComprehension
IO.puts "also doubled with comprehension:"
IO.inspect alsoDoubledWithComprehension
