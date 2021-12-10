#Variaveis;
#populacaototal=50000; ## o total de individuos será o dobro, visto que faz 2 a cada rodada
#numindividuos=10;
#limpa=populacaototal;
#linhapontuacaofpa=50;
#pontusolucaoindividuo=zeros(nduplasaula*nturmas,dias*nprofessor_ndisciplinas_sala,limpa); #total de 200 individuos
#pontuincompatibilidadeprof=zeros(50,3,limpa); ## Crio 50 incompatibilidade de prof, uma pra cada individuo
#pontuincompatibilidadesalas=zeros(50,3,limpa); ## Crio 50 incompatibilidade de salas, uma pra cada individuo
#aptos=zeros(50,2);
#pontufitness = zeros(limpa,2);

#Play;


#clear -x solucaoindividuo,pontuincompatibilidadeprof,pontuincompatibilidadesalas,pontufitness,i;
for individuoatual = 1:numindividuos
  Play; ##Gero um novo individuo
  pontusolucaoindividuo(1:14,1:18,individuoatual)=solucaoinicial; ##Armazeno o individuo que acabei de criar
  fitness; ##Avalio esse individuo
endfor






