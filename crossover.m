do
  individuoscrossorteado=rand(1,2);
   for cont = 1:numindividuos
     if((individuoscrossorteado(1,1))>=ponturanqueado(cont,5)&& individuoscrossorteado(1,1)<=ponturanqueado(cont,6))
        individuocross1=ponturanqueado(cont,2);
     endif
     if((individuoscrossorteado(1,2))>=ponturanqueado(cont,5)&& individuoscrossorteado(1,2)<=ponturanqueado(cont,6))
        individuocross2=ponturanqueado(cont,2);
     endif
  endfor
until(individuocross1!=individuocross2);
#OBTER O INDIVIDUO SORTEADO MUTAR ATRAVÉS DO METODO ROLETA


indicecross=randi(2); #vou fazer x troca de turmas, podendo ser 1-7
#fazer sorteio de 1 até 7
[row1, column1] = find(pontufitness(:,2) == individuocross1);
[row2, column2] = find(pontufitness(:,2) == individuocross2);
#Sorteio de ponto, primeiro ponto a escsolha da turma, o segundo ponto

#vou sortear um numero 1 ou 2, de quem vai ser o dna principal herdado
dnaprincipal=randi(2);
individuoatual=individuoatual+1;

turmaspossiveis=[1,3,5,7,9,11,13];
turmasorteadas = turmaspossiveis(randperm(numel(turmaspossiveis)));

if(dnaprincipal==1)
    pontusolucaoindividuo(:,:,individuoatual)=pontusolucaoindividuo(:,:,row1);
else
    pontusolucaoindividuo(:,:,individuoatual)=pontusolucaoindividuo(:,:,row2);
endif

for i = 1:indicecross
    sorteio=randi(2);
    if(mod(i,2)==1)
        if(sorteio==1)
         pontusolucaoindividuo(turmasorteadas(i):turmasorteadas(i)+1,:,individuoatual)=pontusolucaoindividuo(turmasorteadas(i):turmasorteadas(i)+1,:,row1);
        else
         pontusolucaoindividuo(turmasorteadas(i):turmasorteadas(i)+1,:,individuoatual)=pontusolucaoindividuo(turmasorteadas(i):turmasorteadas(i)+1,:,row2);
        endif
    endif
endfor
