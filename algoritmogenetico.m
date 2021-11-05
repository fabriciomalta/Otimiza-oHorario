Variaveis;
populacaototal=200000000; ## o total de individuos será o dobro, visto que faz 2 a cada rodada
numindividuos=10;
limpa=50000;

pontusolucaoindividuo=zeros(nduplasaula*nturmas,dias*nprofessor_ndisciplinas_sala,limpa); #total de 200 individuos
pontuincompatibilidadeprof=zeros(50,3,limpa); ## Crio 50 incompatibilidade de prof, uma pra cada individuo
pontuincompatibilidadesalas=zeros(50,3,limpa); ## Crio 50 incompatibilidade de salas, uma pra cada individuo

pontufitness = zeros(limpa,2);
populacaoinicial;
geracao=50; #Controle de geracao, cada geracao é formado pela quantidade de numindivididuos

#como eu ja gerei 10 individuos da minha populacao inicial, começarei do inviduo 11 pra frente
zap=0;
pessoasgeradas=numindividuos
gerou=0;

#for super=11:total
do
  selecao; ### escolher individuo
  chancemutar=rand(1); 
  if(chancemutar<=0.40) #10 % de chance de mutar
    mutacao2; ##GERA+1
    #mutacao3;
    pessoasgeradas=pessoasgeradas+1;
    printf("Pontuação do indíviduo: %d", pessoasgeradas);
    gerou=1;
    fitness;
    pontufitness(pessoasgeradas,1)
    if((mod(individuoatual,numindividuos)==0) && (gerou ==1))
         geracao=geracao+numindividuos;
    endif;
      if(mod(individuoatual,limpa)==0)
      #source('limpa.m');
      endif
  endif
  if(ultpt<60000)
    #break;
  endif
  chancecross=rand(1);
        if(chancecross<=0.99)
           crossover; ##GERA+1
           gerou=1;
           pessoasgeradas=pessoasgeradas+1;
           fitness; ##Avalio o novo individuo acabado de ser gerado
            printf("Pontuação do indíviduo: %d", pessoasgeradas);
            pontufitness(pessoasgeradas,1)          
        if((mod(individuoatual,numindividuos)==0) && (gerou ==1))
           geracao=geracao+numindividuos;
        endif;
        if(mod(individuoatual,limpa)==0)
         #source('limpa.m');
        endif;
  endif
gerou=0;
#endfor
until(pessoasgeradas==populacaototal*numindividuos);
#until(ultpt<60000);

#plot(pontufitness)
## Trabalhar a partir dos 10 melhores feitos, atualizando esse ranking, sempre
# que tiver uma nova população