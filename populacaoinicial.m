
#Play;


#clear -x solucaoindividuo,pontuincompatibilidadeprof,pontuincompatibilidadesalas,pontufitness,i;
for individuoatual = 1:numindividuos
  Play; ##Gero um novo individuo
  pontusolucaoindividuo(1:14,1:18,individuoatual)=solucaoinicial; ##Armazeno o individuo que acabei de criar
  fitness; ##Avalio esse individuo
endfor






