populacaoinicial
populacaototal=500; ## o total de individuos será o dobro, visto que faz 2 a cada rodada
geracao=10; #Controle de geracao, cada geracao é formado por 10 individuos
#como eu ja gerei 10 individuos da minha populacao inicial, começarei do inviduo 11 pra frente

#for i = 11:populacaototal
do
  selecao; ###
  
  test=randi(2);
  if(test==1)
  mutacao; ##GERA+1
  fitness; ##Avalio o indidividuo acabado de ser gerado 
  else
    mutacao2; ##GERA+1
  fitness;
  endif
  if(pontufitness(individuoatual,1)<=10000)
  break;
  endif
  crossover; ##GERA+1
  fitness; ##Avalio o novo individuo acabado de ser gerado
  if(mod(individuoatual,10)==0)
  geracao=geracao+10;
endif
until(pontufitness(individuoatual,1)<=10000)
#endfor
