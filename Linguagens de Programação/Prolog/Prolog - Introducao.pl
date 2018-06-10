%============== FATOS ==========================
%robo/1
robo(rob).
robo(piter).

%homem/1
homem(renato).
homem(marcelo).
homem(carlos).
homem(renan).
homem(marcio).
homem(roberto).

%mulher/1
mulher(nadia).

%pai/2
pai(renato,marcelo).
pai(renato,carlos).
pai(roberto,renato).

%mae/2
mae(maria,roberto).
mae(karina,carlos).

%construiu/2
construiu(marcelo,piter).

%ama/2
ama(nadia,renato).

cls :- write('\e[2J').  %Limpa a tela do console

%======== REGRAS ==========================================
%neto/2
neto(X,Y):- home(X),pai(Z,X),pai(Y,Z).
avo(X,Y):- neto(Y,X).

%repita/0
repita :- repita.
repita.

%todosHomemns/0
todosHomens :- homem(H),write(H),nl,fail.
%todosHomens.

%maior/3
maior(N,N,M) :- N >= M,!.
maior(M,N,M) :- N < M.


%LA�O FOR
%laco/2
laco(I,N):- I is N+1,!.
laco(I,N):- write(I), write(' '),
           I2 is I+1,
           laco(I2,N).

%REPETI��O

%Somat�rio de I a N - vers�o iterativa
%Acc: acumulador
%Ex.: somaIter(Somatorio,0,1,10).            somat�rio de 1 a 10
%somaIter/4
somaIter(Acc,Acc,I,N) :- I is N+1,!.
somaIter(Soma,Acc,I,N) :- Soma2 is Acc+I,II is I+1,
                          somaIter(Soma,Soma2,II,N).

%Somat�rio de I a N - vers�o recursiva
%Ex.: somaRec(Somatorio,1,10).               somat�rio de 1 a 10
%somaRec/3
somaRec(Soma,I,N):- I is N+1,Soma is 0,!.
somaRec(Soma,I,N) :- II is I+1,
                     somaRec(Soma2,II,N),
                     Soma is I+Soma2.

igual(N,N).    % Tudo � igual a si mesmo

%============ ESTRUTURAS ========================
% Palavras que s�o usadas para se referir a objetos com
%    partes que devem ser nomeadas individualmente.
% As estruturas possuem 2 tipos de componentes:
%  funtor: � invariavelmente um �tomo e serve para identificar a
%          estrutura.
%  argumentos: s�o usados para nomear as partes do objeto composto.
%              Eles podem ser constantes, vari�veis, n�meros e at�
%              mesmo outras estruturas.
machuca(derrubar(H),H):-animal(H).
% O primeiro objeto do predicado "machuca" � a estruturas "derrubar(H)"
%  O funtor desta estrutura � "derrubar" e o �nico argumento � H.
%
%  As estruturas s�o formalmente id�ntica aos predicados. Os predicados
%    n�o passam de estruturas declarando coisas que podem ser
%    verdadeiras ou falsas. Embora todo predicado seja uma estrutura,
%    nem toda estrutura � predicado. Isto porque h� estruturas que est�o
%    apenas nomeando objetos e, portanto, n�o fazem nenhuma declara��o
%    que possa ser considerada verdadeira ou falsa.
aniversario(renata,data(3,fevereiro,1996)).

signo(Pessoa,aquario):- aniversario(Pessoa, data(Dia,janeiro,_)),
                        Dia >= 20.
signo(Pessoa,aquario):- aniversario(Pessoa, data(Dia,fevereiro,_)),
                        Dia =< 18.

% signo(Pessoa,aquario):- aniversario(Pessoa, data(Dia,Mes,_)),
%                (Mes=janeiro,Dia>=20);(Mes=fevereiro,Dia =< 20).


%================  BACKTRACKING =======================
p :-  q, r, s.

q :- writeln('q1').
q :- writeln('q2'),fail.

r :- writeln('r1').
r :- writeln('r2').
r :- writeln('r3'),fail.

s :- writeln('s1').
s :- writeln('s2').
s :- writeln('s3').
s :- writeln('s4'),fail.



a(a1,1).
a(_,2).
a(a3,N).
b(2,B).
b(1,b1).
c(X,Y) :- a(X,N), b(N,Y).



































