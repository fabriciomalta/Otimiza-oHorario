Play;
populacaototal=200;
pontusolucaoindividuo=zeros(nduplasaula*nturmas,dias*nprofessor_ndisciplinas_sala,200); #total de 200 individuos
pontuincompatibilidadeprof=zeros(50,3,200); ## Crio 200 incompatibilidade de prof, uma pra cada individuo
pontuincompatibilidadesalas=zeros(50,3,200); ## Crio 200 incompatibilidade de salas, uma pra cada individuo
pontufitness = zeros(200,2);

#clear -x solucaoindividuo,pontuincompatibilidadeprof,pontuincompatibilidadesalas,pontufitness,i;
for individuoatual = 1:10
  Play; ##Gero um novo individuo
  fitness; ##Avalio esse individuo
  pontusolucaoindividuo(1:14,1:18,individuoatual)=solucaoinicial; ##Armazeno o individuo que acabei de criar
  pontuincompatibilidadeprof(1:rows(finalpontuacaoprofessores),1:3,individuoatual)=finalpontuacaoprofessores; ## Armazeno a incompatibilidade do invididuo
  pontuincompatibilidadesalas(1:rows(finalpontuacaosalas),1:3,individuoatual)=finalpontuacaosalas;  ## Armazeno a incompatibilidade;
  clear -x pontusolucaoindividuo pontuincompatibilidadeprof pontuincompatibilidadesalas pontufitness individuoatual
endfor