Variaveis;
solucaoinicial= pontusolucaoindividuo(:,:,individuoatual);
#pontuacaofpa;
pontuacaosalas;
pontuacaoprofessores;
somapontuacaosalas = 0;
somapontuacaoprofessores = 0;
if(!isempty(finalpontuacaosalas))
somapontuacaosalas = sum(finalpontuacaosalas(:,3));
endif
if(!isempty(finalpontuacaoprofessores))
somapontuacaoprofessores =sum(finalpontuacaoprofessores(:,3));
endif
pontufitness(individuoatual,1)=somapontuacaosalas+somapontuacaoprofessores; ##Somar as incompatibilidades de professor e de sala

pontufitness(individuoatual,2)=individuoatual; ## Armazenar o individuo;

if(!isempty(finalpontuacaoprofessores))
pontuincompatibilidadeprof(1:rows(finalpontuacaoprofessores),1:3,individuoatual)=finalpontuacaoprofessores; ## Armazeno a incompatibilidade do invididuo
endif
if(!isempty(finalpontuacaosalas))
pontuincompatibilidadesalas(1:rows(finalpontuacaosalas),1:3,individuoatual)=finalpontuacaosalas;  ## Armazeno a incompatibilidade;
endif
ultpt = somapontuacaosalas+somapontuacaoprofessores;

if(ultpt==0)
printf("Solu��o Encontrada!:\n");
solucaoinicial = pontusolucaoindividuo(:,:,individuoatual);
pontuacaofpa;
solucionado=1;
plot(pontufitness)
xlim([0 individuoatual + 50])
xlabel("Individuos")
ylabel("Incompatbilidades")
#pause(50)
endif
clear -x atualizarank total solucionado limpa gerou pessoasgeradas pontuacaofpa individuomutarsorteado linhapontuacaofpa pontusolucaoindividuo ponturanqueado numindividuos populacaototal pontuincompatibilidadeprof pontuincompatibilidadesalas pontufitness geracao individuoatual nprofessor_ndisciplinas_sala dias nturmas individuomutar  individuocross1 individuocross2 individuoatual ultpt