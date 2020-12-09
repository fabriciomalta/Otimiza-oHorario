Variaveis;
solucaoinicial= pontusolucaoindividuo(:,:,individuoatual)
#pontuacaofpa;
pontuacaosalas;
pontuacaoprofessores;
pontufitness(individuoatual,1)=sum(finalpontuacaosalas(:,3))+sum(finalpontuacaoprofessores(:,3)); ##Somar as incompatibilidades de professor e de sala
pontufitness(individuoatual,2)=individuoatual; ## Armazenar o individuo;
pontuincompatibilidadeprof(1:rows(finalpontuacaoprofessores),1:3,individuoatual)=finalpontuacaoprofessores; ## Armazeno a incompatibilidade do invididuo
pontuincompatibilidadesalas(1:rows(finalpontuacaosalas),1:3,individuoatual)=finalpontuacaosalas;  ## Armazeno a incompatibilidade;

clear -x pontusolucaoindividuo pontuincompatibilidadeprof pontuincompatibilidadesalas pontufitness geracao individuoatual nprofessor_ndisciplinas_sala dias nturmas individuomutar  individuocross1 individuocross2 individuoatual