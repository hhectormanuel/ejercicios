defmodule Ejercicio do
    def factorial(numero) do
        Enum.reduce(1..numero, 1, fn x, acc -> x * acc end)
    end
    def palindromo(palabra) do
        if palabra == String.reverse(palabra) do
            "Si es palindromo"
        else
            "No es palindromo"
        end
    end
    def numeroPrimo(numero) do
        #IO.puts("los numeros primos son")

        #lista = Enum.reduce(1..longitud, [], fn x, acc-> List.insert_at(acc,0,Enum.random(1..longitud))end)
        #|>Enum.filter(fn x -> x in )
        ##Enum.filter(fn x -> x !=2 && rem(x,2) != 0 end)
        lista = [1,2,3,5,7]
        if numero in lista do
            "Es numero primo"
        else
            list = Enum.filter(List.delete(lista, 1), fn x -> rem(numero, x)== 0 end)
            if length(list) >= 1 do
                "No es numero primo"
            else
                "Es numero primo"
            end

        end
        
        
    end
    def anoBisiesto(anio) do
        if rem(anio,4) == 0 do
            if rem(anio, 100) == 0 do
                if rem(anio, 400) == 0 do
                    "bisiesto"
                else
                    "no bisiesto"
                end
            else
                "bisiesto"
            end
        else
            "no bisiesto"
        end
    end
    
    def progresion_geometrica(primer_termino, razon)do
    lista = Enum.reduce(1..7, [primer_termino], fn _, acc -> acc ++ [List.last(acc) * razon]  end)
    [_,_,_,_, quinto,_ ,_,_] = lista
    "el quinto elemento es #{quinto} y la suma de los primero 8 valores es #{Enum.sum(lista)}"
    end

    def fibonacci(termino) do
    #Tuple.append(acc, x)
    #Tuple.append(elem(acc,-1)+ elem(acc,2))
        cond do
            termino == 1 -> [1]
            termino == 2 -> [1]
            termino >2 ->
                Enum.reduce(1..termino-2, [1,1], fn _, acc -> acc ++ fibonacci_form(acc, termino) end)
                |> List.last()
        end
    end

    defp fibonacci_form(acc, _) do
        [hd | tail] = Enum.reverse(acc)
        [hd+ hd(tail)]
    end

    # def perfectnumber(n, d) do
    #     # cond do
    #     #     rem(n,d) != 0 ->
    #     #         "No es divisor"
    #     #     true ->
    #     #         Enum.reduce()
    #     # end
    # end
    def par(lista) do
        par = Enum.sum(Enum.filter(lista, fn x -> rem(x,2)==0 end))
        impar = Enum.sum(Enum.filter(lista, fn x -> rem(x,2)!=0 end))
        "suma de pares es = #{par},suma de impar es = #{impar}"
    end

    def negative_number(list) do
        "El numero mas grande es = #{Enum.max(list)} de #{length(list)} elementos"
    end
    def list(lista) do
        lenlist(lista, length(lista))
    end
    defp lenlist(lista, len) when len > 0 do
        IO.puts(lista)
        lenlist(lista, len-1)
    end
    defp lenlist(_lista, 0) do
        :ok
    end

    def sort(lista) do
        IO.puts("ascendente")
        IO.inspect(Enum.sort(lista))
        IO.puts("ascendente")
        IO.inspect(Enum.reverse(Enum.sort(lista)))
        :ok
    end

    def mean(lista) do
        promedio = Enum.sum(lista)/length(lista)
    end

    def actualizarprecio(mapa, new_price) do
    #%{sku: 87504, nombre: "aceite", cantidad: 4, precio: 24.00}
    # cond do
    #      ->
            
    # end
    mapa.nombre
        
    end

end