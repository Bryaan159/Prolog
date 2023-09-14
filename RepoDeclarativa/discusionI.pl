escribir_letra(M):-
	M =< 0,
	writeln("Debe ingrsar un numero mayor a 0."),
	!, fail.

escribir_letra(M):-
	writeln("Digite la letra a repetir:"),
	read(L),
        escribir(M,L).

escribir(_, L):-
	\+ atom(L),
	write("Debe de digital una letra"),
	!,fail.

escribir(0, _):- !.

escribir(M, L):-
    M > 0,
    writeln(L),
    N1 is M-1,
    escribir(N1,L).

%Ejercicio 2
%Restaurante
calorias(paella,200).
calorias(gazpacho,150).
calorias(filete,400).
calorias(pollo,280).
calorias(trucha,160).
calorias(bacalao,300).
calorias(flan,200).
calorias(miel,500).
calorias(naranja,50).

valor_calorico(X,Y,Z,V):-
	calorias(X,A),
	calorias(Y,B),
	calorias(Z,C),
	V is A + B + C.

valor_calorico(X,Y,Z):-
	valor_calorico(X,Y,Z,V),
	V =< 800,
	writeln("La comida es equlibrada").

valor_calorico(X,Y,Z):-
	valor_calorico(X,Y,Z,V),
	valor > 800,
	writeln("La comida es mala").


%Ejercicio 3
% El enemigo de mi enemigo, es mi amigo.
enemigo(rusia,ucrania).
enemigo(ucrania,rusia).
enemigo(rusia,japon).
enemigo(japon,rusia).
enemigo(usa,rusia).
enemigo(rusia,usa).
enemigo(china,usa).
enemigo(usa,china).
enemigo(usa,cuba).
enemigo(cuba,usa).

no_enemigo(X,Y):-
	not(enemigo(X,Y)),
	not(enemigo(Y,X)).

aliado(X,Y,Z):-
	no_enemigo(X,Y),
	no_enemigo(X,Z),
	no_enemigo(Y,Z),
	dif(X,Y),
	dif(X,Z),
	dif(Y,Z).

%Ejercicio 4
%Clausula de aridad 2
%parametro 1:n�mero
%paremtro 2: suma de digitos del numero

sumadigitos(N,M):-
	number(N),
	sumar(N,0,M).

sumar(0,M,M):-!.

sumar(N,V,M):-
	N >0;
	Res is N mod 10,
	C is N //10,
	V1 is V + Res,
	sumar(C,V1,M).



%Ejercicio Pepito
local(cine).
local(supermercado).
local(tienda).
local(zapateria).
local(banco).

%Validar

puede_ir(X):-
  local(X).

no_puedeIr(X,Y,Z):-
  puede_ir(X),
  puede_ir(Y),
  puede_ir(Z),
  dif(X,Y),
  dif(X,Z),
  dif(Y,Z).
