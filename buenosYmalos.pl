%gusto(persona, hábito)
gusto(julia,estudiar(ssoo,2)).
gusto(julia,jugar(lol,7)).
gusto(marcos,criticarA(nacho)).
gusto(pedro,practicarDeporte(futbol,2)).
gusto(nacho,jugar(minecraft,6)).
gusto(nacho,jugar(lol,6)).
gusto(nacho,criticarA(camila)).
gusto(sofia,estudiar(pdep,3)).
gusto(sofia,jugar(minecraft,4)).
gusto(camila,estudiar(pdep, 2)).
gusto(camila,practicaDeporte(natacion, 3)).
gusto(martin, criticarA(Persona)):- 
    gusto(Persona, jugar(_, Horas)), Horas > 4.
gusto(camila, Habito):- gusto(sofia, Habito), 
    not(gusto(julia, Habito)).
gusto(laura, jugar(minecraft, 3)).

%%Punto 2
eslaPerdicion(Persona):- persona(Persona), 
    forall(gusto(Persona, Habito), malHabito(Habito)).

malHabito(jugar(_, Cant)):- Cant > 5.
malHabito(criticarA(Alguien)):- gusto(Alguien, estudiar(pdep, _)).

persona(Persona):- gusto(Persona, _).


% Punto 3
esVago(Persona):-persona(Persona), not(gusto(Persona, estudiar(_, _))),
    juegaAtodosLosJuegos(Persona).

juegaAtodosLosJuegos(Persona):-
    forall(juego(Juego), gusto(Persona, jugar(Juego, _))).

juego(Juego):-gusto(_,jugar(Juego,_)).

%%Punto 4

esFeliz(Persona):-persona(Persona), consumoHoras(Persona, CantHoras), 
            CantHoras > 8.

consumoHoras(Persona, Horas):- 
    findall(CantHoras, tiempoHabito(Persona, CantHoras), ListaHoras), 
    sumlist(ListaHoras, Horas).

tiempoHabito(Persona, Horas):- gusto(Persona, Habito), 
    horasConsumo(Habito, Horas).

horasConsumo(estudiar(_, Horas), Horas).
horasConsumo(jugar(_, Horas), Horas).
horasConsumo(practicaDeporte(_ ,Horas), Horas).
horasConsumo(criticarA(_), 1).

%Punto 5
tieneUnicoHabitoSaludable(Persona):- gusto(Persona, Habito), 
            esSaluble(Habito), 
            not((gusto(Persona, OtroHabito), Habito \= OtroHabito)).

esSaluble(estudiar(_,_)).
esSaluble(practicarDeporte(_, _)).

% Punto 6
mantenerAlejado(Persona, OtraPersona):- persona(Persona), 
    not(malaInfluencia(Persona)), sonAmigos(Persona, OtraPersona), 
    malaInfluencia(OtraPersona).

malaInfluencia(Persona):- esVago(Persona).
malaInfluencia(Persona):- eslaPerdicion(Persona).

sonAmigos(Persona, OtraPersona):- amigo(Persona, OtraPersona).
sonAmigos(Persona, OtraPersona):-amigo(Persona, UnAmigo), 
    sonAmigos(UnAmigo, OtraPersona).


amigo(julia, marcos).
amigo(marcos,  pedro).
amigo(pedro, nacho).
amigo(pedro, sofia).

