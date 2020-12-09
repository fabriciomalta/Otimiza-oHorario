solucaoinicial= pontusolucaoindividuo(:,:,individuoatual)
pontuacaofpa;
pontuacaosalas;
pontuacaoprofessores;
pontufitness(individuoatual,1)=sum(finalpontuacaosalas(:,3))+sum(finalpontuacaoprofessores(:,3)); ##Calcular as incompatibilidade
pontufitness(individuoatual,2)=individuoatual; ## Armazenar o individuo;
pontuincompatibilidadeprof(1:rows(finalpontuacaoprofessores),1:3,individuoatual)=finalpontuacaoprofessores; ## Armazeno a incompatibilidade do invididuo
pontuincompatibilidadesalas(1:rows(finalpontuacaosalas),1:3,individuoatual)=finalpontuacaosalas;  ## Armazeno a incompatibilidade;
