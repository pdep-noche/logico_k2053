%seVa(Persona, Lugar)
seVa(dodain, pehuenia).
seVa(dodain, sanMartin).
seVa(dodain,esquel).
seVa(dodain, sarmiento).
seVa(dodain, camarones).
seVa(dodain, playasDoradas).
seVa(alf, bariloche).
seVa(alf, sanMartin).
seVa(alf, elBolson).
seVa(nico, marDelPlata).
seVa(vale, calafate).
seVa(vale, elBolson).
seVa(martu, Lugar):- seVa(nico, Lugar).
seVa(martu, Lugar):- seVa(alf, Lugar).

%atraccion(Lugar, Atraccion)
atraccion(esquel, parqueNacional(losAlerces)).
atraccion(esquel, excursion(trochita)).
atraccion(esquel, excursion(trevelin)).
atraccion(pehuenia, cerro(bateaMahuida, 2000)).
atraccion(pehuenia, cuerpoDeAgua(moquehue, puedePescar, 14)).
atraccion(pehuenia, cuerpoDeAgua(alumine, puedePescar, 19)).

persona(Persona):-seVa(Persona, _).

vacacionesCopadas(Persona):-persona(Persona), 
    forall(seVa(Persona, Lugar), tieneAtraccionCopada(Lugar)).

tieneAtraccionCopada(Lugar):-atraccion(Lugar, Atraccion), 
                esCopada(Atraccion).

esCopada(cerro(_, Altura)):- Altura > 2000.
esCopada(cuerpoDeAgua(_, puedePescar, _)).
esCopada(cuerpoDeAgua(_, _, Temperatura)):- Temperatura  > 20.
esCopada(playa(Diferencia)):- 5 > Diferencia.
esCopada(excursion(Nombre)):- atom_length(Nombre, Length), Length > 7.
esCopada(parqueNacional(_)).

%Punto3
noSeCruzaron(Persona, OtraPersona):-persona(Persona),
         persona(OtraPersona),   Persona \= OtraPersona, 
         not(seCruzaron(Persona, OtraPersona)).

seCruzaron(Persona, OtraPersona):- seVa(Persona, Lugar),  seVa(OtraPersona, Lugar). 
  
%Punto 4
vacacionesGasoleras(Persona):- persona(Persona), 
    forall(seVa(Persona, Lugar), esGasolero(Lugar)).

esGasolero(Lugar):- costoDeVida(Lugar, Costo), 160 > Costo. 

costoDeVida(sarmiento, 100).
costoDeVida(esquel, 150).
costoDeVida(pehuenia, 180).
costoDeVida(sanMartin, 150).
costoDeVida(camarones, 135).
costoDeVida(playasDoradas, 170).
costoDeVida(bariloche, 140).
costoDeVida(elCalafate, 240).
costoDeVida(elBolson, 145).
costoDeVida(marDelPlata, 140).


%Punto5
itinerariosPosibles(Persona, Lugares):- persona(Persona),
    findall(Lugar, seVa(Persona, Lugar), Lista), 
    permutacion(Lista, Lugares).

permutacion([], []).
permutacion(Lista, [Elem| OtraLista]):-
    eliminar(Elem, Lista, Resto), 
    permutacion(Resto, OtraLista).

eliminar(Elem, [Elem| Resto], Resto).
eliminar(Elem, [OtroElem| Lista], [OtroElem| Resto]):-
    eliminar(Elem, Lista, Resto).