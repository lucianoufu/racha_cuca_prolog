/*
Nome: Luciano Soares Nascimento
Matricula: 11811ECP024
OBS: A unidade de altura no programa está em cm.
*/

resolve(S) :-
    S = grid(joquei(_,_,_,_,_,_),
                joquei(_,_,_,_,_,_),
                joquei(_,_,_,_,_,_),
                joquei(_,_,_,_,_,_),
                joquei(_,_,_,_,_,_)),

    /*1 - o jóquei de camiseta vermeha está em algum lugar à esquerda do jóquei 
    de 50kg*/
    algum_lugar_a_esquerda(A1, B1, S),
    camisa(A1, vermelha),
    peso(B1, 50),

    /*2 - Na terceira posição está o jóquei do cavalo Ozzy*/
    terceiro(A2, S),
    cavalo(A2, ozzy),

    /*3 - Ronaldo está ao lado do homem de 1,62m.*/
    ao_lado(A3, B3, S),
    nome(A3, ronaldo),
    altura(B3, 162),

    /*4 - O jóquei de 51kg está exatamente à direita do jóquei de camiseta amarela*/
    exatamente_a_direita(A4, B4, S),
    peso(A4, 51),
    camisa(B4, amarela),

    /*5 - O homem que nasceu no Paraná está ao lado do joquei de 1,54m.*/
    ao_lado(A5, B5, S),
    estado(A5, parana),
    altura(B5, 154),

    /*6 - O jóquei de 1,54m está em algum lugar entre o jóquei de goiás e o jóquei 
    mais baixo, nessa orde.*/
    entre(A6, B6, C6, S),
    altura(A6, 154),
    estado(B6, goias),
    altura(C6, 150),

    /*7 - Na segunda posição está o jóquei de Goiás*/
    segundo(A7, S),
    estado(A7, goias),

    /*8 - Ronaldo está ao lado do jóquei de 1,54*/
    ao_lado(A8, B8, S),
    nome(A8, ronaldo),
    altura(B8, 154),

    /*9 - Gérson está exatamente à direita de Itamar */
    exatamente_a_direita(A9, B9, S),
    nome(A9, gerson),
    nome(B9, itamar),

    /*10 - O jóquei de camiseta Amarela está em algum lugar à esquerda do 
    jóquei de 52kg.*/
    algum_lugar_a_esquerda(A10, B10, S),
    camisa(A10, amarela),
    peso(B10, 52),

    /*11 - O jóquei do cavalo Marvin está na primeira posição.*/
    primeiro(A11, S),
    cavalo(A11, marvin),

    /*12 - O homem mais alto está em algum lugar entre o homem de branco 
    e o homem de 150m, nessa ordem*/
    entre(A12, B12, C12, S),
    altura(A12, 166),
    camisa(B12, branca),
    altura(C12, 150),

    /*13 - Belchior está em uma das pontas*/
    uma_das_pontas(A13, S),
    nome(A13, belchior),

    /*14 - O jóquei de camiseta Verde está em algum lugar à esquerda do jóquei 
    do Ceará*/
    algum_lugar_a_esquerda(A14, B14, S),
    camisa(A14, verde),
    estado(B14, ceara),

    /*15 - O homem de 1,58m está exatamente à direita do jóquei que nasceu na 
    região Norte*/
    exatamente_a_direita(A15, B15, S),
    altura(A15, 158),
    estado(B15, amapa),

    /*16 - O jóquei de 53kg está ao lado do jóquei de camiseta amarela*/
    ao_lado(A16, B16, S),
    peso(A16, 53),
    camisa(B16, amarela),

    /*17 - Itamar está exatamente à esquerda do jóquei do cavalo gordon*/
    exatamente_a_esquerda(A17, B17, S),
    nome(A17, itamar),
    cavalo(B17, gordon),

    /*18 - O homem de camiseta verde está ao lado do homem do paraná*/
    ao_lado(A18, B18, S),
    camisa(A18, verde),
    estado(B18, parana),

    /*19 - O jóquei de 1,58m está exatamente à esquerda do jóquei de 
    santa catarina*/
    exatamente_a_esquerda(A19, B19, S),
    altura(A19, 158),
    estado(B19, santa_catarina),

    /*20 - O jóquei do cavalo apolo está em algum lugar à direita do 
    jóquei de camisa vermelha*/
    algum_lugar_a_direita(A20, B20, S),
    cavalo(A20, apolo),
    camisa(B20, vermelha),

    /*21 - O jóquei de amarelo está em algum lugar entre o jóquei do amapá e o 
    belchior, nessa ordem.*/
    entre(A21, B21, C21, S),
    camisa(A21, amarela),
    estado(B21, amapa),
    nome(C21, belchior),

    /*condição de fechamento*/
    joquei_do_grid(A22, S),
    nome(A22, amauri),

    joquei_do_grid(B22, S),
    camisa(B22, azul),

    joquei_do_grid(C22, S),
    peso(C22, 49),

    joquei_do_grid(C22, S),
    cavalo(C22, tempestade).

joquei_do_grid(X, grid(X,_,_,_,_)).
joquei_do_grid(X, grid(_,X,_,_,_)).
joquei_do_grid(X, grid(_,_,X,_,_)).
joquei_do_grid(X, grid(_,_,_,X,_)).
joquei_do_grid(X, grid(_,_,_,_,X)).

camisa(joquei(X,_,_,_,_,_), X).
nome(joquei(_,X,_,_,_,_), X).
peso(joquei(_,_,X,_,_,_), X).
altura(joquei(_,_,_,X,_,_), X).
estado(joquei(_,_,_,_,X,_), X).
cavalo(joquei(_,_,_,_,_,X), X).

primeiro(X, grid(X,_,_,_,_)).
segundo(X,  grid(_,X,_,_,_)).
terceiro(X, grid(_,_,X,_,_)).

algum_lugar_a_direita(X, Y,grid(Y,X,_,_,_)).
algum_lugar_a_direita(X, Y,grid(Y,_,X,_,_)).
algum_lugar_a_direita(X, Y,grid(Y,_,_,X,_)).
algum_lugar_a_direita(X, Y,grid(Y,_,_,_,X)).
algum_lugar_a_direita(X, Y,grid(_,Y,X,_,_)).
algum_lugar_a_direita(X, Y,grid(_,Y,_,X,_)).
algum_lugar_a_direita(X, Y,grid(_,Y,_,_,X)).
algum_lugar_a_direita(X, Y,grid(_,_,Y,X,_)).
algum_lugar_a_direita(X, Y,grid(_,_,Y,_,X)).
algum_lugar_a_direita(X, Y,grid(_,_,_,Y,X)).

algum_lugar_a_esquerda(X, Y, grid(X,Y,_,_,_)).
algum_lugar_a_esquerda(X, Y, grid(X,_,Y,_,_)).
algum_lugar_a_esquerda(X, Y, grid(X,_,_,Y,_)).
algum_lugar_a_esquerda(X, Y, grid(X,_,_,_,Y)).
algum_lugar_a_esquerda(X, Y, grid(_,X,Y,_,_)).
algum_lugar_a_esquerda(X, Y, grid(_,X,_,Y,_)).
algum_lugar_a_esquerda(X, Y, grid(_,X,_,_,Y)).
algum_lugar_a_esquerda(X, Y, grid(_,_,X,Y,_)).
algum_lugar_a_esquerda(X, Y, grid(_,_,X,_,Y)).
algum_lugar_a_esquerda(X, Y, grid(_,_,_,X,Y)).

exatamente_a_esquerda(X, Y, grid(X,Y,_,_,_)).
exatamente_a_esquerda(X, Y, grid(_,X,Y,_,_)).
exatamente_a_esquerda(X, Y, grid(_,_,X,Y,_)).
exatamente_a_esquerda(X, Y, grid(_,_,_,X,Y)).

exatamente_a_direita(X, Y, grid(Y,X,_,_,_)).
exatamente_a_direita(X, Y, grid(_,Y,X,_,_)).
exatamente_a_direita(X, Y, grid(_,_,Y,X,_)).
exatamente_a_direita(X, Y, grid(_,_,_,Y,X)).

/* ao_lado(X, Y, grid(Y,X,_,_,_)).
ao_lado(X, Y, grid(Y,_,X,_,_)).
ao_lado(X, Y, grid(Y,_,_,X,_)).
ao_lado(X, Y, grid(Y,_,_,_,X)).
ao_lado(X, Y, grid(_,Y,X,_,_)).
ao_lado(X, Y, grid(_,Y,_,X,_)).
ao_lado(X, Y, grid(_,Y,_,_,X)).
ao_lado(X, Y, grid(_,_,Y,X,_)).
ao_lado(X, Y, grid(_,_,Y,_,X)).
ao_lado(X, Y, grid(_,_,_,Y,X)).
ao_lado(X, Y, grid(X,Y,_,_,_)).
ao_lado(X, Y, grid(X,_,Y,_,_)).
ao_lado(X, Y, grid(X,_,_,Y,_)).
ao_lado(X, Y, grid(X,_,_,_,Y)).
ao_lado(X, Y, grid(_,X,Y,_,_)).
ao_lado(X, Y, grid(_,X,_,Y,_)).
ao_lado(X, Y, grid(_,X,_,_,Y)).
ao_lado(X, Y, grid(_,_,X,Y,_)).
ao_lado(X, Y, grid(_,_,X,_,Y)).
ao_lado(X, Y, grid(_,_,_,X,Y)). */


ao_lado(X, Y, grid(X,Y,_,_,_)).
ao_lado(X, Y, grid(_,X,Y,_,_)).
ao_lado(X, Y, grid(_,_,X,Y,_)).
ao_lado(X, Y, grid(_,_,_,X,Y)).
ao_lado(X, Y, grid(Y,X,_,_,_)).
ao_lado(X, Y, grid(_,Y,X,_,_)).
ao_lado(X, Y, grid(_,_,Y,X,_)).
ao_lado(X, Y, grid(_,_,_,Y,X)).


entre(X,Y,Z, grid(Y,X,Z,_,_)).
entre(X,Y,Z, grid(Y,X,_,Z,_)).
entre(X,Y,Z, grid(Y,X,_,_,Z)).
entre(X,Y,Z, grid(Y,_,X,Z,_)).
entre(X,Y,Z, grid(Y,_,X,_,Z)).
entre(X,Y,Z, grid(Y,_,_,X,Z)).
entre(X,Y,Z, grid(_,Y,X,Z,_)).
entre(X,Y,Z, grid(_,Y,X,_,Z)).
entre(X,Y,Z, grid(_,Y,_,X,Z)).
entre(X,Y,Z, grid(_,_,Y,X,Z)).

uma_das_pontas(X,grid(X,_,_,_,_)).
uma_das_pontas(X,grid(_,_,_,_,X)).
