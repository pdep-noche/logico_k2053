mortal(Persona):-humano(Persona).
humano(socrates).

hablaIdioma(juan, espaniol).
hablaIdioma(juan, ingles).
hablaIdioma(juan, italiano).
hablaIdioma(marcela, espaniol).
hablaIdioma( hernan , aleman).

seComunican(Persona,OtraPersona):- hablaIdioma(Persona,Idioma),
hablaIdioma(OtraPersona,Idioma), Persona \= OtraPersona.

curso(julia,fisicaI).
curso(emilio , inglesII).
curso(elizabeth , quimica).
curso(pedro,economia).

aprobo(emilio , inglesII).
aprobo(elizabeth , quimica).
desaprobo(Persona, Materia):- curso(Persona, Materia), 
    not(aprobo(Persona,Materia)).

siguiente(Numero, Siguiente):- numero(Numero), Siguiente is Numero + 1.

numero(Numero):-between(1,10,Numero).

mayor(Mayor, Menor):- numero(Mayor), numero(Menor), Mayor >Menor.



contador(roque).
joven(roque).
trabajoEn(roque,acme).
trabajoEn(marta, acme).
trabajoEn(ana,omni).
trabajoEn(lucia,omni).
trabajoEn(pablo, fiat).
honesto(roque).
ingeniero(ana).
ingeniero(marta).
habla(roque,frances).
habla(ana,ingles).
habla(ana,frances).
habla(lucia,ingles).
habla(lucia,frances).
habla(cecilia,frances).
abogado(cecilia).
ambicioso(cecilia).
ambicioso(pablo).
ambicioso(Persona):-contador(Persona), joven(Persona).
tieneExperiencia(Persona):- trabajoEn(Persona, _).
profesional(Persona):- contador(Persona).
profesional(Persona):- abogado(Persona).
profesional(Persona):- ingeniero(Persona).  
puedeAndar(comercioExterior, Persona):- ambicioso(Persona).
puedeAndar(contaduria, Persona):- contador(Persona), honesto(Persona).
puedeAndar(ventas, Persona):- ambicioso(Persona), tieneExperiencia(Persona).         
puedeAndar(ventas, lucia).
puedeAndar(proyectos, Persona):-ingeniero(Persona), tieneExperiencia(Persona).
puedeAndar(proyectos, Persona):-abogado(Persona), joven(Persona).
puedeAndar(logistica, Persona):-profesional(Persona), cumpleCondicion(Persona).

cumpleCondicion(Persona):- joven(Persona).
cumpleCondicion(Persona):- trabajoEn(Persona, omni).

