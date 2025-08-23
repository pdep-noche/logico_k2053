%creeEn(Persona, Personaje)
creeEn(gabriel, campanita).
creeEn(gabriel, magoOz).
creeEn(gabriel, cavenaghi).
creeEn(juan, conejoDePascua).
creeEn(macarena, reyesMagos).
creeEn(macarena, magoCapria).
creeEn(macarena, campanita).

%quiere(Persona, Sueño)
quiere(gabriel, ganarLoteria([5,9])).
quiere(gabriel, futbolista(arsenal)).
quiere(juan, cantante(100000)).
quiere(macarena, cantante(10000)).

persona(Persona):-quiere(Persona, _).

%Punto2
esAmbicioso(Persona):-persona(Persona), 
    sumaTotalDificultades(Persona, Total), Total > 20.

sumaTotalDificultades(Persona, Suma):- 
    findall(Dificultad, dificultad(Persona, Dificultad), Lista), 
    sumlist(Lista,Suma).

dificultad(Persona, Dificultad):-quiere(Persona, Quiere), 
    nivelDificultad(Quiere, Dificultad).

nivelDificultad(cantante(Discos), 6):- Discos > 500000.
nivelDificultad(cantante(Discos), 4):- Discos =< 500000.
nivelDificultad(ganarLoteria(Numeros), Total):- length(Numeros, Cant), 
                Total is 10 * Cant.
nivelDificultad(futbolista(Equipo), 3):- equipoChico(Equipo).
nivelDificultad(futbolista(Equipo), 16):- not(equipoChico(Equipo)).

equipoChico(arsenal).
equipoChico(aldosivi).


