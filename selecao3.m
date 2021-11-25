#### para saber qual individuo eu irei escolher, eu irei fazer um sorteio da seguinte format
#### PEGAREI OS ULTIMOS 10 INDIVIDUSO GERADOS, JÁ QUE ELES PERTENCERÃO A ULTIMA POPULAÇÃO GERADA
#### Farei um SORTEIO DA SEGUInte forma, um sorteio de 0 a 100, onde a probabilidade de cair o individuo mais apto é maior
#SORTEAR UM NUMERO DE 0 A 100
#20% de cair melhor individuo 1-20 1
#19% de cair no segundo melhor individuo 21-39 2
#17- 40-56 3
#11- 57-67 4
#10 - 68-77 5
#8 - 78-85
#6 - 86 - 91
#5 92-96
#3 97-99
#1% chance de cair pior individuo 100-100 
#ABAIXO EU REORGANIZO MEUS ULTIMOS 10 INDIVIDUOS FEITOS COM BASE NA MENOR PONTUAÇÃO ENTRE ELES
ponturanqueado=zeros(limpa,6);

#cponturanqueado=zeros(populacaototal*numindividuos,2);
cponturanqueado=pontufitness;
cponturanqueado(cponturanqueado==0)=NaN;
rankanterior=zeros(numindividuos,2);
ranknovo = zeros(numindividuos,2);

if(atualizarank==1)
rankanterior(1:numindividuos,1:2)=sortrows(cponturanqueado(geracao-2*numindividuos+1:geracao-numindividuos,1:2));
ranknovo(1:numindividuos,1:2)=sortrows(cponturanqueado(geracao-numindividuos+1:geracao,1:2));
ranknovo(numindividuos-1:numindividuos,:)=rankanterior(1:2,:);
#CASO EU PRECISE ATUALIZAR O RANK, 
#PEGAREI TODOS DA GERAÇÃO ANTERIOR E SALVAREI DOIS, 
#ELIMINAREI OS DOIS PIORES DA GERAÇÃO NOVA E AI FAÇO O RANK DE DESTRIBUIÇÃO DE PONTOS
atualizarank=0;
endif
ponturanqueado(1:numindividuos,1:2)=sortrows(ranknovo(1:numindividuos,1:2));
#ponturanqueado(1:geracao,1:2)=sortrows(cponturanqueado(1:geracao,1:2));
#SORTEIO UM INDIVIDUO PARA APLICAR A MUTAÇÃO E DEPOIS SORTEIO DOIS PARA APLICAR CROSSOVER
###SALVAR APENAS UM/DOIS DA GERAÇÃO ANTERIOR, O RESTANTE/MAIOR PARTE DA GERACAO NOVA


numdasorte1=0;
cont=1;
  for cont = 1:numindividuos
    ponturanqueado(cont,3)=(min(ponturanqueado(1:numindividuos,1))/ponturanqueado(cont,1));
  endfor

  ##AQUI EU ATRIBUO AS PROBABILIDADES DE CADA UM E JÁ COLOCO O INTERVALO DE VALORES DE CADA UM
  for cont = 1:numindividuos
    ponturanqueado(cont,4)=(ponturanqueado(cont,3)/sum(ponturanqueado(1:numindividuos,3)));
    ponturanqueado(cont,5)=numdasorte1+0.0000000001;
    ponturanqueado(cont,6)=numdasorte1+ponturanqueado(cont,4);
    numdasorte1=numdasorte1+ponturanqueado(cont,4);
  endfor

zap=1;