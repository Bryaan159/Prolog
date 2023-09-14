mas_grande(elefante,caballo).
mas_grande(caballo,perro).
mas_grande(perro,raton).

muchomas_grande(A,C):-
    mas_grande(A,B),
    mas_grande(B,C).

%-------
padrede(martin,luis).
padrede(luis,jose).
padrede(luis,pedro).
espadre(martin).
espadre(luis).

%reglas
hijode(B,A):-
    padrede(A,B).

%reglas AND
abuelode(A,C):-
    %abuelo sea padre de mi padre
    padrede(A,B),
    %mi padre es mi padre
    padrede(B,C).

hermanode(B,C):-
    espadre(A),
    padrede(A,B),
    padrede(A,C).

%reglas_OR
familiarde(A,B):-
    padrede(A,B);hijode(A,B);hermanode(A,B);abuelode(A,B).
%----------------------------------------------
%Contar desde N hasta 1

%Caso base
contar_hasta_1(1):-
    writeln(1).


contar_hasta_1(N):-
    %verifica que n es mayor que 1
    N > 1,
    %imprime el valor actual de la N
    writeln(N),
    %Resta un 1 a la N actual para que vaya de manera descendente.
    N1 is N - 1,
    %Llamada de nuevo, pero con el valor actual.
    contar_hasta_1(N1).

%-----------------------------------
%Ejemplo 2: Imprimir una letra N veces

imprimir_letra(N):-
    N  =< 0,
    writeln('Debe de ingresar mayor que 0'),
    !,fail.

imprimir_letra(N):-
    write('Ingrese la letra que quiere repetir:'),
    read(L),
    imprimir(N,L).

imprimir(_, L):-
    \+ atom(L),
    write("Debe digitar una letra"),
    !, fail.

imprimir(0,_):-!.

imprimir(N,L):-
    N > 0,
    writeln(L),
    N1 is N-1,
    imprimir(N1,L).

%-------------------------------------
%Suma de numeros enteros desde 1 hasta N
sumar_hasta(N,_):-
    N =< 0,
    writeln('Debe de ingresar un número mayor a 0'),
    !,
    fail.

sumar_hasta(N,Suma):-
    sumar(N,Suma).

sumar(0,0).

sumar(N,Suma):-
    N > 0,
    N1 is N - 1,
    sumar(N1,SumaAnterior),
    Suma is SumaAnterior + N.

%Ejercicio #4
%Calcular Factorial
%Caso base cuando es 0!
factorial(0,1):-!.

%Caso base cuando es 1!
factorial(1,1):-!.

factorial(N,Fact):-
    N > 1,
    is(Nm1, -(N,1)),
    %Se resta un numero anterior y luego se almacena temporalmente para irse a multiplicar.
    factorial(Nm1,FactAux),
    is(Fact,*(N,FactAux)).


%Ejercico #5
%Potencia de un número
calPotencia(base,exp,resultado):-
    exp =< 0,
    writeln('Debe de ingresar un exponente mayor a 0'),
    !,
    fail.

calPotencia(_,0,1):-
    !.

calPotencia(base,exp,resultado):-
    exp > 0,
    expAux is exp - 1,
    calPotencia(base,expAux,resultado1),
    resultado is base * resultado1.

%Ejercicio #6
%Numeros pares hasta N
numeros_pares(N) :-
    N =< 0,
    writeln("Debe ingresar un número mayor a 0"),
    !,
    fail.

numeros_pares(N) :-
    imprimir_pares(N).

imprimir_pares(0):-
    !.
imprimir_pares(N) :-
    N > 0,
    writeln('MOD'+(N mod 2)),
    N mod 2 =:= 0,
    writeln(N),
    N1 is N - 2,
    imprimir_pares(N1).

%Si el numero ingresado es impar le resta un 1 para poder hacerlo
imprimir_pares(N) :-
    N > 0,
    N mod 2 =\= 0,
    N1 is N - 1,
    imprimir_pares(N1).

%-----------------------------------------
%????
%Suma de los digitos de un numero
suma_digitos(0,0):- !.

suma_digitos(numero,suma):-
    numero > 0 ,
    digito is mod(numero,10),
    numero1 is div(numero,10),
    suma_digitos(numero1,Suma1),
    suma is Suma1 + digito.




