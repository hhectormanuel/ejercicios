defmodule Ejercicio do
  def factorial(numero) do
    Enum.reduce(1..numero, 1 , fn x, acc -> x * acc end)
  end

  def palindromo?(palabra) do
    String.reverse(palabra) == palabra
  end

end
