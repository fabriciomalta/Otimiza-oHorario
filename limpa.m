cponturanqueado=pontufitness;
cponturanqueado(cponturanqueado==0)=NaN;

ponturanqueado(1:geracao,1:2)=sortrows(cponturanqueado(1:geracao,1:2));

  ###CASO JÁ TENHA GERADO 1000 INDIVIDUOS, EU ZERO OS QUE NÃO VÃO SER MAIS USADOS, PRA ALIVIAR O PROGRAMA
if(mod(individuoatual,limpa)==0)
  for cont = 1:numindividuos
    pontusolucaoindividuo(:,:,cont)=pontusolucaoindividuo(:,:,ponturanqueado(cont,2));
    pontuincompatibilidadesalas(:,:,cont)=pontuincompatibilidadesalas(:,:,ponturanqueado(cont,2));
    pontuincompatibilidadeprof(:,:,cont)=pontuincompatibilidadeprof(:,:,ponturanqueado(cont,2));
    pontufitness(cont,:)=pontufitness(ponturanqueado(cont,2),:);    
    ponturanqueado(cont,2)=cont;
 
  endfor
  pontusolucaoindividuo(:,:,numindividuos+1:limpa)=0;
  pontuincompatibilidadesalas(:,:,numindividuos+1:limpa)=0;
  pontuincompatibilidadeprof(:,:,numindividuos+1:limpa)=0;
  pontufitness(numindividuos+1:limpa,:)=0;
  ponturanqueado(numindividuos+1:limpa,:)=0;
  pontufitness(1:numindividuos,2)=ponturanqueado(1:numindividuos,2);
  individuoatual=numindividuos;
  geracao=20;
endif