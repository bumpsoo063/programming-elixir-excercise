defmodule Ch10 do
  defmodule MyEnum do
    @spec all?(maybe_improper_list, any) :: boolean
    def all?([], _func), do: true
    def all?([head | tail], func) do
      case func.(head) do
        false -> false
        true -> all?(tail, func)
      end
    end

    def each([], _func), do: :ok
    def each([head | tail], func) do
      func.(head)
      each(tail, func)
    end

    def filter([], _func), do: []
    def filter([head | tail], func) do
      case func.(head) do
        false -> filter(tail, func)
        true -> [head | filter(tail, func)]
      end
    end

    # reverse
    defp reverse(list, new \\ [])
    defp reverse([], new), do: new
    defp reverse([head | tail], new),
    do: reverse(tail, [head | new])

    defp split_recur(list, cnt, new \\ [])
    defp split_recur(list, 0, new), do: {reverse(new), list}
    defp split_recur([head | tail], cnt, new),
    do: split_recur(tail, cnt - 1, [head | new])


    def split(list, cnt) when is_list(list) and cnt >= 0,
      do: split_recur(list, cnt)
    def split(list, cnt) when is_list(list),
      do: reverse(list) |> split_recur(-cnt)


    def take(_list, 0), do: []
    def take([head | tail], pos) when pos >= 0,
      do: [head | take(tail, pos - 1)]
    def take(list, pos),
      do: take(reverse(list), -pos) |> reverse
  end
  def flatten(list), do: flatten(list, [])
  defp flatten(list, new)
  defp flatten([], new), do: new |> Enum.reverse
  defp flatten([head | tail], new) when is_list(head) do
    flatten(tail, flatten(head, new))
  end
  defp flatten([head | tail], new) do
    flatten(tail, [ head | new ])
  end

  def prime_list(n) when n >= 2 do
    Enum.reject(2..n, &is_prime/1)
  end

  defp is_prime(n), do: is_prime(n, 2)
  defp is_prime(n, index) when index < n and rem(n, index) != 0, do: is_prime(n, index + 1)
  defp is_prime(n, index) when index < n and rem(n, index) == 0, do: true
  defp is_prime(_, _), do: false
end
