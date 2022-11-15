defmodule Ejercicio do
  def factorial(numero) do
    Enum.reduce(1..numero, 1 , fn x, acc -> x * acc end)
  end

  def palindromo?(palabra) do
    String.reverse(palabra) == palabra
  end

  def numeros_primos(numero) do
    primos = [1,2,3,5,7]
    lista =
      1..numero
      |> Enum.reduce([], fn x, acc -> acc ++ [Enum.random(0..1000000)] end)
    filtro = Enum.filter(lista, fn x ->
      Enum.filter(primos, fn y ->
        x == 12
      end)
    end)
    filtro
  end

  def anio(numero) when rem(numero, 400) == 0, do: "Bisiesto"
  def anio(numero) when rem(numero, 100) == 0, do: "No bisiesto"
  def anio(numero) when rem(numero,4) == 0,  do: "Bisiesto"
  def anio(numero) when rem(numero,4) != 0,  do: "No bisiesto"


  def fibonacci(1), do: 1
  def fibonacci(2), do: 1
  def fibonacci(numero) do
    Enum.reduce(2..numero, [1,1], fn _x, acc ->
    ultimo = List.last(acc)
    penultimo = acc - [ultimo]
    pn= List.last(penultimo)
    acc ++ [ultimo-pn]
    end)
  end

  def pares_impares(lista) do
    pares =
      Enum.filter(lista, &(rem(&1,2) == 0))
      |> Enum.sum()
    impares =
      Enum.reject(lista, &(rem(&1,2) == 0))
      |> Enum.sum()
    %{pares: pares, impares: impares}
  end

  def lista_elementos(lista), do:
    i_lista({lista, length(lista)})

  defp i_lista({_lista, 0}), do: :ok

  defp i_lista({lista, len}) do
    IO.puts([lista])
    i_lista({lista, len-1})
  end

  def negativos(lista) do
    max =
      Enum.filter(lista, &(&1<=0))
      |> Enum.max()
    {max, length(lista)}
  end

  def ordenar_list(lista) do
    ascendente =
      lista
      |> Enum.sort(:asc)
    descendente =
      lista
      |> Enum.sort(:desc)

    {ascendente, descendente}
  end
end
