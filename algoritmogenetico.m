Variaveis;
populacaototal=10000; ## o total de individuos será o dobro, visto que faz 2 a cada rodada
numindividuos=10;
limpa=10000;
linhapontuacaofpa=50;
pontusolucaoindividuo=zeros(nduplasaula*nturmas,dias*nprofessor_ndisciplinas_sala,limpa); #total de 200 individuos
pontuincompatibilidadeprof=zeros(50,3,limpa); ## Crio 50 incompatibilidade de prof, uma pra cada individuo
pontuincompatibilidadesalas=zeros(50,3,limpa); ## Crio 50 incompatibilidade de salas, uma pra cada individuo

pontufitness = zeros(limpa,2);
populacaoinicial;

geracao=numindividuos; #Controle de geracao, cada geracao é formado pela quantidade de numindivididuos
solucionado = 0;


#como eu ja gerei 10 individuos da minha populacao inicial, começarei do inviduo 11 pra frente
zap=0;
pessoasgeradas=numindividuos
gerou=0;
atualizarank = 0;
selecao;
#Estou chamando a seleção aqui porque, quando gerar uma população nova, preciso reaarranjar o rank dela;
#for super=11:total
do
  #selecao; ### escolher individuo
  individuomutarsorteado=rand(1);
  
  chancemutar=rand(1); 
  if(chancemutar<=0.55) #Coeficiente de chance de mutação  
    mutacao2; ##GERA+1
    pessoasgeradas=pessoasgeradas+1;
    gerou=1;
    fitness;
    printf("Pontuação do indíviduo: %d", pessoasgeradas);
    pontufitness(pessoasgeradas,1)   
    if((mod(individuoatual,numindividuos)==0) && (gerou ==1))
         geracao=geracao+numindividuos;
         atualizarank = 1;
         ##Essa seleção basicamente serve para atualizar o rank
         selecao3;
    endif;
      if(mod(individuoatual,limpa)==0)
      #source('limpa.m');
      endif
  endif
  if(ultpt<60000)
    #break;
  endif
  chancecross=rand(1);
        if(chancecross<=0.50)
           crossover; ##GERA+1
           gerou=1;
           pessoasgeradas=pessoasgeradas+1;
           fitness; ##Avalio o novo individuo acabado de ser gerado
            printf("Pontuação do indíviduo: %d", pessoasgeradas);
            pontufitness(pessoasgeradas,1)          
        if((mod(individuoatual,numindividuos)==0) && (gerou ==1))
           geracao=geracao+numindividuos;
           atualizarank = 1;
           selecao3;
        endif;
        if(mod(individuoatual,limpa)==0)
         #source('limpa.m');
        endif;
  endif
gerou=0;
#endfor
#until(pessoasgeradas==populacaototal);
#until((pessoasgeradas==populacaototal*numindividuos) || (linhapontuacaofpa<15));
until((pessoasgeradas==populacaototal*numindividuos) || (solucionado==1));
#until(ultpt<60000);

#plot(pontufitness)
## Trabalhar a partir dos 10 melhores feitos, atualizando esse ranking, sempre
# que tiver uma nova população