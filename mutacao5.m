  ## AQUI EU DESCUBRO QUEM � O INDIVIDUO QUE VOU MUTAR
  for cont = 1:numindividuos
   if((individuomutarsorteado)>=ponturanqueado(cont,5)&& individuomutarsorteado<=ponturanqueado(cont,6))
      individuomutar=ponturanqueado(cont,2);
   endif
  endfor
  # AQUI DCESCUBRO OS INDIVIDUOS QUE VOU RECOMBINAR, FA�O ISSO AT� QUE N�O SEJAM IGUAIS!

 indicemutacao = 1; # quantas mutacao eu vou fazer por individuo
 
 #### na mutacao, inicialmente vou me basear s� no horario dos professores, como indice principal  de altera��o
 ###Gerarei um individuo baseado na altera��o por professores, outro pela altera��o de salas
 individuoatual=individuoatual+1;
 pontusolucaoindividuo(:,:,individuoatual)=pontusolucaoindividuo(:,:,individuomutar);
 colunadiasdasemana=[3,6,9,12,15,18];
 turmas=[1,3,5,7,9,11,13];
 auxdupl=zeros(2,3);
 auxsolo=zeros(1,3);
 entrou=0;
 tipomutacao = randi(2);
 #for i = 1:indicemutacao

 #endfor
do 
    diasorteado = colunadiasdasemana(randi(numel(colunadiasdasemana)));
    novodiasorteado = colunadiasdasemana(randi(numel(colunadiasdasemana)));
    turmasorteada = turmas(randi(numel(turmas)));
until ((diasorteado!=novodiasorteado) && (pontusolucaoindividuo(turmasorteada,diasorteado,individuoatual)!=-1) && (pontusolucaoindividuo(turmasorteada,novodiasorteado,individuoatual)!=-1))
      
#Tabela das Muta��es
#Muta��o 1 = Realizar a troca do bloco inteiro do dia, ou seja, exemplo seria trocar a segunda pela sexta completamente;
#Na muta��o 1 eu realizo dois sorteios, pra ver qual turma vou pegar do dia de origem e qual turma irei pegar do dia de destino;
#Muta��o 2 = Realizar apenas a invers�o da primeira aula da noite com a ultima aula da noite do dia sorteado;

#Primeiro devo verificar se h� disciplina >100, pois se tiver, n�o ser� poss�vel fazer sorteio, e o dias devem ser trocados inteiros;
#E claro, n�o h� como fazer a muta��o do tipo 2, portanto somente essa ser� feita
if((pontusolucaoindividuo(turmasorteada,diasorteado-1,individuoatual)>=100) || (pontusolucaoindividuo(turmasorteada,novodiasorteado-1,individuoatual)>=100))
   tipomutacao=1;    
else
   tipomutacao=randi(2);
endif       
       

if(tipomutacao==1)
    if((pontusolucaoindividuo(turmasorteada,diasorteado-1,individuoatual)>=100) || (pontusolucaoindividuo(turmasorteada,novodiasorteado-1,individuoatual)>=100))  
          auxdupl(1,:)=pontusolucaoindividuo(turmasorteada,diasorteado-2:diasorteado,individuoatual);
          auxdupl(2,:)=pontusolucaoindividuo(turmasorteada+1,diasorteado-2:diasorteado,individuoatual);              
          pontusolucaoindividuo(turmasorteada,diasorteado-2:diasorteado,individuoatual)= pontusolucaoindividuo(turmasorteada,novodiasorteado-2:novodiasorteado,individuoatual);
          pontusolucaoindividuo(turmasorteada+1,diasorteado-2:diasorteado,individuoatual)= pontusolucaoindividuo(turmasorteada+1,novodiasorteado-2:novodiasorteado,individuoatual);               
          pontusolucaoindividuo(turmasorteada,novodiasorteado-2:novodiasorteado,individuoatual)=auxdupl(1,:);            
          pontusolucaoindividuo(turmasorteada+1,novodiasorteado-2:novodiasorteado,individuoatual)=auxdupl(2,:);   
    else
    #CASO N�O TENHA MAT�RIA DUPLICADA EM NENHUM DOS DOIS DIAS SORTEADOS, VOU FAZER DOIS NOVOS SORTEIOS
    #UM SORTEIO PRA VER QUAL DISCIPLINA IREI PEGAR DO DIASORTEADO
    #OUTRO SORTEIO PRA VER QUAL DISCIPLINA IREI PEGAR DO NOVODIASORTEADO
    coeficientetroca1 = round(rand);
    coeficientetroca2 = round(rand);
    #AGORA QUE J� TENHO OS COEFICIENTE DE TROCA, VAMOS REALIZAR A TROCA
         auxsolo=pontusolucaoindividuo(turmasorteada+coeficientetroca1,diasorteado-2:diasorteado,individuoatual);
         pontusolucaoindividuo(turmasorteada+coeficientetroca1,diasorteado-2:diasorteado,individuoatual) = pontusolucaoindividuo(turmasorteada+coeficientetroca2,novodiasorteado-2:novodiasorteado,individuoatual);
         pontusolucaoindividuo(turmasorteada+coeficientetroca2,novodiasorteado-2:novodiasorteado,individuoatual)=auxsolo;
    endif
else 
    if(tipomutacao==2)
    #CASO A MUTACAO SEJA = 2, BASTA EU INVERTER A DISCIPLINA DO DIASORTEADO CASO, CLARO N�O TENHA DISCIPLINA DUPLICADA    
          auxinverter = pontusolucaoindividuo(turmasorteada+1,diasorteado-2:diasorteado,individuoatual);
          pontusolucaoindividuo(turmasorteada+1,diasorteado-2:diasorteado,individuoatual) = pontusolucaoindividuo(turmasorteada,diasorteado-2:diasorteado,individuoatual);
          pontusolucaoindividuo(turmasorteada,diasorteado-2:diasorteado,individuoatual) = auxinverter;  
     endif    
endif      
  
  