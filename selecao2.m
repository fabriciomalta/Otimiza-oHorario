#populacao de 20 individuos


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
ponturanqueado=zeros(populacaototal*numindividuos,6);
cponturanqueado=zeros(populacaototal*numindividuos,2);
cponturanqueado=pontufitness;
cponturanqueado(cponturanqueado==0)=NaN;

ponturanqueado(1:geracao,1:2)=sortrows(cponturanqueado(1:geracao,1:2));
#SORTEIO UM INDIVIDUO PARA APLICAR A MUTAÇÃO E DEPOIS SORTEIO DOIS PARA APLICAR CROSSOVER

individuomutarsorteado=rand(1);

numdasorte1=0;
cont=1;
  for cont = 1:10
    ponturanqueado(cont,3)=(min(ponturanqueado(1:10,1))/ponturanqueado(cont,1));
  endfor
  ##AQUI EU ATRIBUO AS PROBABILIDADES DE CADA UM E JÁ COLOCO O INTERVALO DE VALORES DE CADA UM
  for cont = 1:10
    ponturanqueado(cont,4)=(ponturanqueado(cont,3)/sum(ponturanqueado(1:10,3)));
    ponturanqueado(cont,5)=numdasorte1+0.0000000001;
    ponturanqueado(cont,6)=numdasorte1+ponturanqueado(cont,4);
    numdasorte1=numdasorte1+ponturanqueado(cont,4);
  endfor
  ## AQUI EU DESCUBRO QUEM É O INDIVIDUO QUE VOU MUTAR
  for cont = 1:10
   if((individuomutarsorteado)>=ponturanqueado(cont,5)&& individuomutarsorteado<=ponturanqueado(cont,6))
      individuomutar=ponturanqueado(cont,2);
   endif
  endfor
  # AQUI DCESCUBRO OS INDIVIDUOS QUE VOU RECOMBINAR, FAÇO ISSO ATÉ QUE NÃO SEJAM IGUAIS!
do
  individuoscrossorteado=rand(1,2);
   for cont = 1:10
     if((individuoscrossorteado(1,1))>=ponturanqueado(cont,5)&& individuoscrossorteado(1,1)<=ponturanqueado(cont,6))
        individuocross1=ponturanqueado(cont,2);
     endif
     if((individuoscrossorteado(1,2))>=ponturanqueado(cont,5)&& individuoscrossorteado(1,2)<=ponturanqueado(cont,6))
        individuocross2=ponturanqueado(cont,2);
     endif
  endfor
until(individuocross1!=individuocross2);
#OBTER O INDIVIDUO SORTEADO MUTAR ATRAVÉS DO METODO ROLETA
zap=1;
