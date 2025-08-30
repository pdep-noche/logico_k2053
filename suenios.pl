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

%%Punto 3
tieneQuimica(Personaje, Persona):- creeEn(Persona, Personaje), 
    cumpleCondiciones(Persona, Personaje).

cumpleCondiciones(Persona, campanita):- dificultad(Persona, Dificultad), 
    Dificultad < 5.
cumpleCondiciones(Persona, Personaje):- Personaje \= campanita, 
    todosLosSueniosPuros(Persona), not(esAmbicioso(Persona)).

todosLosSueniosPuros(Persona):- forall(quiere(Persona, Suenio), esPuro(Suenio)).

esPuro(futbolista(_)).
esPuro(cantante(Discos)):- Discos < 200000.

%Punto 4
puedeAlegrar(Personaje, Persona):-quiere(Persona,_),
    tieneQuimica(Personaje, Persona), 
    cumpleCondicionesParaAlegrar(Personaje).

cumpleCondicionesParaAlegrar(Personaje):-sano(Personaje).
cumpleCondicionesParaAlegrar(Personaje):-backup(Personaje, Backup), 
    sano(Backup).


sano(Personaje):- not(enfermo(Personaje)).

backup(Personaje, OtroPersonaje):- amigo(Personaje, OtroPersonaje).
backup(Personaje, OtroPersonaje):- amigo(Personaje, Backup), 
    backup(Backup, OtroPersonaje).

amigo(campanita, reyesMagos).
amigo(campanita, conejoDePascua).
amigo(conejoDePascua, cavenaghi).

enfermo(campanita).
enfermo(reyesMagos).
enfermo(conejoDePascua).

