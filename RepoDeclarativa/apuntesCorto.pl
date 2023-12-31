%Ejemplo
% Escriba un programa que realice un conteo iniciando en 1 y terminando
% en un valor X con ayuda de un progreso recursivo.


%----------------
%contarHasta(X) :-
%    hacerCiclo(1, X).

%hacerCiclo(N, X) :-
%    N =< X,
%    writeln('Ciclo'),
%    writeln(N),
%    N1 is N + 1,
%    hacerCiclo(N1, X).

%hacerCiclo(N, X) :-
%    N > X.

%-------------------



%Ejemplo #2
%Ejemplo de conteo ascendente con ayuda de procesos recursivos
contarHasta(X):-
    hacerCiclo(1,X).

hacerCiclo(X1,LimpSup):-
    ==(X1,LimpSup),
    write('Ultima ejecuci�n:'),
    write(X1),
    write('.Fin de llamadas recursivas'),nl,
    !.
hacerCiclo(N,X):-
    <(N,X),
    write('Ciclo'),
    write(N),
    nl,
    is(X1,+(N,1)),
    hacerCiclo(X1,X).


%-------------------------------------------------------------
%Ejercicio 1
%Solicitar la cantidad de veces que vamos a imprimir
escribir_letra(N):-
    N =< 0,
    writeline("Debe de ingresar un numero mayor a 0"),
    !,fail.

escribir_letra(N):-
    write("Digite la letra a repetir: "),
    read(L),
    escribir(N,L).

escribir(_, L):-
    \+ atom(L),
    write("Debe digitar una letra"),
    !,fail.

escribir(0,_):- !.

escribir(N,L):-
    N >0,
    writeln(L),
    N1 is N-1,
    escribir(N1,L).

%Ejercicio 2
menu(paella,200).
menu(gazpacho,150).
menu(consome,300).
menu(filete,400).
menu(pollo,280).
menu(trucha,160).
menu(bacalao,300).
menu(flan,200).
menu(nueces,500).
menu(naranja,50).

%a) Defina la relaci�n calorias/2 que indicar� que una raci�n de cada
% alimentotiene de los de la lista tiene determinadas calor�as.
calorias2(Alimento,Calorias):-
    menu(Alimento,Calorias).

%b)La regla valor_calorico(X, Y, Z, V) que indicar� que las porciones X, Y y
%Z de la comida suma en total V calor�as.

valor_calorico(X,Y,Z,V):-
    menu(X,A),
    menu(Y,B),
    menu(Z,C),
    V is A+B+C.


valor_calorico(X,Y,Z):-
    valor_calorico(X,Y,Z,V),
    V =< 800,
    writeln("La comida es equilibrada").

valor_calorico(X,Y,Z):-
    valor_calorico(X,Y,Z,V),
    V > 800,
    writeln("La comida lamentablemente no es equilibrada").


%Ejercicio #6
%El enemigo de mi enemigo, es mi amigo. La historia de la humanidad est� plagada
% de guerras. Reyes, presidentes, conquistadores y estrategas de las
% batallas han debido conseguir, cuando es necesario, aliados para
% vencer a su oponente. Elabore la regla aliado/3 en la que el primer
% argumento es alguien que quiere vencer a la persona indicada en el
% segundo argumento. El tercer argumento es el posible
% aliado del primero. La cl�usula debe verificar si los primeros dos son
% enemigos mutuos y luego verificar si el tercer argumento es enemigo
% del segundo. Elabore la relaci�n enemigo/2 para varios individuos y
% pruebe la regla elaborada.
enemigo(rusia,ucrania).
enemigo(ucrania,rusia).
enemigo(china,filipinas).
enemigo(filipinas,china).
enemigo(china,vietnam).
enemigo(vietnam,china).
enemigo(china,taiwan).
enemigo(taiwan,china).
enemigo(israel,palestina).
enemigo(palestina,israel).
enemigo(alemania,francia).
enemigo(francia,alemania).

%Verificar que no son enemigos
no_enemigo(X,Y):-
    not(enemigo(X,Y)),
    not(enemigo(Y,X)).
%Verificar que son aliados para vencer el enemigo
aliados(X,Y,Z):-
    no_enemigo(X,Y),
    no_enemigo(X,Z),
    no_enemigo(Y,Z),
    dif(X,Y),
    dif(X,Z),
    dif(Y,Z).
%-----------------------------------------
%Ejercicio#3
% Pepito se escap� de su casa y se fue con sus amigos al centro
% comercial. Estando all� se da cuenta de que sus papas tambi�n han ido
% de compras. Elabore una base de conocimiento que le ayude a Pepito a
% no �encontrarse� con sus pap�s en ning�n lugar del centro comercial,
% es decir, la base de conocimiento debe conocer loslocales y decirle a
% Pepito en qu� lugares del centro comercial podr� estar sin ser visto.
% En muchas ocasiones su pap� y su mam� deciden separarse e ir a locales
% distintos para terminar las compras m�s r�pido. Elabore una regla de
% aridad tres a la que se le indique por medio de dos argumentos en cu�l
% local est� su mam� y en cu�l est� su pap�. En el tercer argumento de
% la cl�usula se devuelven los locales en los que Pepito puede estar.

local(supermercado).
local(zapatos).
local(gym).
local(banco).
local(foodcurt).
local(startbucks).
local(dollarcity).

%verificar que se encuentra en lugar
estaLocal(X):-
    local(X).

no_puedeIr(X,Y,Z):-
    estaLocal(X),
    estaLocal(Y),
    estaLocal(Z),
    dif(X,Y),
    dif(X,Z),
    dif(Y,Z).

%------------------------------------
%Ej.4
% clausula de aridad 2
% parametro 1: numero
% parametro 2: suma de digitos del numero
%
sumardigitos(N, M):-
    number(N),
    sumar(N, 0, M).


sumar(0, M, M):- !.

sumar(N, V, M):-
    N > 0,
    Res is N mod 10,
    C is N // 10,
    V1 is V + Res,
    sumar(C, V1, M).

%-----------------------------------------------------
% Ejercicio #4 Resuelva el problema de calcular el m�ximo com�n divisor
% de dos n�meros enteros aplicando el algoritmo de Euclides, un famoso
% matem�tico griego de la antig�edad. Este consiste en hacer la divisi�n
% entera del mayor de los n�meros entre el menor. Si el residuo es cero,
% el mcd est� en la variable que contiene almenor. Pero si el residuo no
% es cero se realiza el siguiente intercambio: el menor pasa a ser el
% nuevo mayor y el residuo pasa a ser el nuevo menor; luego se repite la
% divisi�n.

euclides(N,0,N):-
    !.
euclides(N,M,X):-
    R is N mod M,
    euclides(M,R,X).

%----
padre(francisco,chico).
padre(chico,paco).
padre(paco,pancho).

regla_ant(X,Y):-
    padre(X,Y),
    writeln(X),
    !.
regla_ant(X,Y):-
    padre(P,X),
    regla_ant(P,Y),
    writeln(P).

%---- Assert -- Abolish -- Dynamic---------
%Declaracion de predicado como din�mico
:- dynamic persona/2.

%Primeros hechos
persona(juan,25).
persona(maria,35).
persona(carolina,27).
persona(manuel,47).
persona(ariel,22).

%Regla para agregar una nueva persona con sus atributos
agregar_persona(Nombre, Edad):-
    assert(persona(Nombre,Edad)).

%Regla para eliminar una persona por nombre
eliminar_persona(Nombre):-
    retract(persona(Nombre,_)).

%Regla para imprimir la lista de personas y edades.
listar_personas:-
    findall((Nombre,Edad),persona(Nombre,Edad),Lista),
    writeln(Lista).

%Eliminar dinamico.
eliminar_todo:-
    writeln('Si quiere eliminar coloque su nombre ''Maria'' o coloque ''N'' '),
    read(Respuesta),
    writeln('Respuesta: '+ Respuesta),
    (
        Respuesta = 'N' ->
            writeln('Operaci�n de eliminaci�n cancelada.');
        writeln('Nombre'+Respuesta),
        eliminar_persona(Respuesta),
        writeln('Persona eliminada correctamente.')
    ).




%-------------Practica Para parcial------------------------------------
conoce(pepito,pedro).
conoce(pedro,rita).
conoce(maria,enrique).
conoce(maria,susana).
conoce(rita,manuel).
conoce(manuel,joaquin).
conoce(manuel,pedro). %Este provoca un ciclo infinito
conoce(manuel,juana).
conoce(jorge,luisa).
conoce(eduardo,rocio).
conoce(alejandra,manuel).
conoce(rubidia,julio).
conoce(maria,jaime).
conoce(luisa,patricia).
conoce(luisa,ricardo).
conoce(enrique,etelvina).
conoce(maria,jorge).
conoce(manuel,alejandra).
conoce(rocio,felipe).
conoce(juana,burbuja).
conoce(rocio,rita).
conoce(jorge,rita).
conoce(luisa,juana).
conoce(juana,burbuja).
conoce(rita,etelvina).
conoce(eduardo,felipe).
conoce(manuel,pedro). %Aqui no provoca
conoce(rita,jorge).
conoce(ricardo,luisa).
conoce(jorge,pedro).
conoce(pedro,jaime).
conoce(susana, maria).
conoce(maria,pedro).
conoce(pedro,eduardo).
conoce(eduardo,raul).
conoce(raul,jaime).
conoce(pedro,juan).
conoce(pablo,joaquin).

% ----------------------------------------------------
% Esta version de la regla evade la dificultad
% de que puede entrar en una recursi�n infinita:
desea_conocer(X,Y):-
    conoce(X,Y),
    writeln(Y).

desea_conocer(X,Y):-
    conoce(X,Z),
    desea_conocer(Z,Y),
    writeln(Z).

% Esta version de la regla evade la dificultad
% caer en una recusion infinita.
desea_conocer_v2(X,Y):-
    abolish(eslabon,1),
    assert(eslabon(X)),
    desea_conocer_v2_rec(X,Y),
    writeln(X).

desea_conocer_v2_rec(X,Y):-
    conoce(X,Y),
    writeln(Y),
    assert(eslabon(Y)),
    !.

desea_conocer_v2_rec(X,_):-
    conoce(X,Z),
    eslabon(Z),
    fail.

desea_conocer_v2_rec(X,Y):-
    conoce(X,Z),
    not(eslabon(Z)),
    assert(eslabon(Z)),
    desea_conocer_v2_rec(Z,Y),
    writeln(Z),
    !.









