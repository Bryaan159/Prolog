%Kevin Bryan Hernández López
%00057720

%Banco De conocimiento de los estados de una Rana
faseRana(huevo).
faseRana(embrion).
faseRana(renacuajo).
faseRana(renacuajo_con_2_patas).
faseRana(renacuajo_con_4_patas).
faseRana(rana_cola_corta).
faseRana(rana_adulta).

%b)Establecer la relaciones de aridad dos
siguienteFase(huevo,embrion).
siguienteFase(embrion,renacuajo).
siguienteFase(renacuajo,renacuajo_con_2_patas).
siguienteFase(renacuajo_con_2_patas,renacuajo_con_4_patas).
siguienteFase(renacuajo_con_4_patas,rana_cola_corta).
siguienteFase(rana_cola_corta,rana_adulta).
siguienteFase(rana_adulta,huevo).

% c) Crear una regla que le proporciona una fase y muestre todas las
% fases del metamorfosis.
metamorfosisRana(X):-
    metamorfosisRana(X,X).

%d) i
% Si se consulta esta regla y no se le pasa argumento, indicar el error% y terminar en fallo
metamorfosisRana:-
    write('Error: usted debe de proporcionar una fase de la rana'),
    fail.

%d) ii
% Si le proporciona a una fase que no existe, desplegar, un mensaje
% indicandole y terminar en fallo.
metamorfosisRana(X,_):-
    \+ faseRana(X),
    writeln('Esa fase no existe dentro de nuestra BC'),
    !,fail.

%d) iii
%Luego mostrar la última fase, indicar que ya no hay más fases.
metamorfosisRana(X,Inicial):-
    writeln(X),
    siguienteFase(X,Siguiente),
    Siguiente \= Inicial,
    metamorfosisRana(Siguiente,Inicial).

metamorfosisRana(X,Y):-
    X == Y,
    write('Ya no hay mas faces para mostrar').
















