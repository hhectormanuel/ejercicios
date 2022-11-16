defmodule Ejercicio do
alias JasonVendored.Encode

  @doc """
  1. factorial
  """
  def factorial(numero) do
    Enum.reduce(1..numero, 1 , fn x, acc -> x * acc end)
  end
  @doc """
  2. palindromo
  """
  def palindromo?(palabra) do
    String.reverse(palabra) == palabra
  end

  @doc """
  3. Numeros primos
  """
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

  @doc """
  4. anio bisiesto
  """
  def anio(numero) when rem(numero, 400) == 0, do: "Bisiesto"
  def anio(numero) when rem(numero, 100) == 0, do: "No bisiesto"
  def anio(numero) when rem(numero,4) == 0,  do: "Bisiesto"
  def anio(numero) when rem(numero,4) != 0,  do: "No bisiesto"

  @doc """
  5. error handling
  """
  def error_handling(primer_termino, razon) do
    lista = Enum.reduce(1..7, [primer_termino], fn _, acc -> acc ++ [List.last(acc) * razon]  end)
    [_,_,_,_, quinto,_ ,_,_] = lista
    "el quinto elemento es #{quinto} y la suma de los primero 8 valores es #{Enum.sum(lista)}"
  end


  @doc """
  6. fibonacci
  """
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

  @doc """
  7. numeros positivios
  """
  def numero_perfecto?(numero) do
    suma =
      Enum.filter(1..numero, fn x -> rem(numero, x) == 0 && x != numero end)
      |> Enum.sum()
    suma == numero
  end

  @doc """
  8. pares impares
  """
  def pares_impares(lista) do
    pares =
      Enum.filter(lista, &(rem(&1,2) == 0))
      |> Enum.sum()
    impares =
      Enum.reject(lista, &(rem(&1,2) == 0))
      |> Enum.sum()
    %{pares: pares, impares: impares}
  end

  @doc """
  10. tamanio de la lista elementos
  """
  def lista_elementos(lista), do:
    i_lista({lista, length(lista)})

  defp i_lista({_lista, 0}), do: :ok

  defp i_lista({lista, len}) do
    IO.puts([lista])
    i_lista({lista, len-1})
  end

  @doc """
  9. mayo numeros negativos
  """
  def negativos(lista) do
    max =
      Enum.filter(lista, &(&1<=0))
      |> Enum.max()
    {max, length(lista)}
  end


  @doc """
  11. ordernar lista ascendente y descendente
  """
  def ordenar_list(lista) do
    ascendente =
      lista
      |> Enum.sort(:asc)
    descendente =
      lista
      |> Enum.sort(:desc)

    {ascendente, descendente}
  end

  @doc """
  12. promedio, media, moda
  """
  def pro_media_moda(lista) do
    len = length(lista)
    prom =
      Enum.sum(lista)/len
      |> round()
    frecuencia = Enum.frequencies(lista)
    value = Enum.reduce(frecuencia, [], fn {k, v}, acc -> acc ++ [v] end)
    max = Enum.max(value)
    moda = Enum.filter(frecuencia, fn {k, v} -> v == max  end)
    |> Enum.find(fn {k, v} -> v == max  end)

    %{promedio: prom, media: prom, moda: moda, mediana: mediana(lista, div(len, 2))}

  end


  defp mediana([head | tail], len) when len > 0, do: mediana(tail, len - 1)

  defp mediana([head | tail], len), do: head


  @doc """
  13. edad codigo postal
  """
  def persona(%{edad: edad, cp: cp}) do
    etapa = cond do
      edad >=6 && edad <= 11 -> "Nino"
      edad >=12 && edad <= 18 -> "Adolecente"
      edad >=19 && edad <= 26 -> "Juventud"
      edad >=27 && edad <= 59 -> "Adulto"
      edad >=60 -> "Persona mayor"
      true -> "Edad invalida"
    end
    {etapa, cp(cp)}
  end

  defp cp(cp) do
    cond do
      cp == 70000 -> "H. CD. Juchitán de Zaragoza"
      cp == 11320 -> "CIudad de Mexico"
      cp == 70110 -> "CD. Ixtepec"
      true -> "CP invalido"
    end
  end

  @doc """
  14. actualizacion precio
  """
  def actualizacion_precio(lista_mapa, sku_producto, nuevo_precio) do
    Enum.reduce(lista_mapa, [], fn %{sku: sku, nombre: nombre, cantidad: cantidad, precio: precio} = x, acc ->
      if sku == sku_producto do
        acc ++ [%{sku: sku, nombre: nombre, cantidad: cantidad, precio: nuevo_precio}]
      else
        acc ++ [x]
      end
    end)
  end

  @doc """
  15. Salario
  """
  @razon_pago 12.8
  def pago_empresa(lista_mapas) do

    Enum.reduce(lista_mapas, [], fn %{name: nombre, hrs: hrs, total: total} = x, acc->
      acc ++ [%{name: nombre, hrs: hrs, total: hrs * @razon_pago}]
    end)

  end

end
