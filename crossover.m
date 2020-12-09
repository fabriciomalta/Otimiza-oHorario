indicecross=1 #vou fazer x troca de turmas, podendo ser 1-7

#vou sortear um numero 1 ou 2, de quem vai ser o dna principal herdado
dnaprincipal=randi(2)
individuoatual=individuoatual+1;

turmaspossiveis=[1,3,5,7,9,11,13];
turmasorteadas = turmaspossiveis(randperm(numel(turmaspossiveis)));
if(dnaprincipal==1)
    pontusolucaoindividuo(:,:,individuoatual)=pontusolucaoindividuo(:,:,individuocross1);
else
    pontusolucaoindividuo(:,:,individuoatual)=pontusolucaoindividuo(:,:,individuocross2);
endif

for i = 1:indicecross
    sorteio=randi(2);
    if(mod(i,2)==1)
        if(sorteio==1)
         pontusolucaoindividuo(turmasorteadas(i):turmasorteadas(i)+1,:,individuoatual)=pontusolucaoindividuo(turmasorteadas(i):turmasorteadas(i)+1,:,individuocross1);
        else
         pontusolucaoindividuo(turmasorteadas(i):turmasorteadas(i)+1,:,individuoatual)=pontusolucaoindividuo(turmasorteadas(i):turmasorteadas(i)+1,:,individuocross2);
        endif
    endif
endfor
