  ## AQUI EU DESCUBRO QUEM É O INDIVIDUO QUE VOU MUTAR
  for cont = 1:numindividuos
   if((individuomutarsorteado)>=ponturanqueado(cont,5)&& individuomutarsorteado<=ponturanqueado(cont,6))
      individuomutar=ponturanqueado(cont,2);
   endif
  endfor
  # AQUI DCESCUBRO OS INDIVIDUOS QUE VOU RECOMBINAR, FAÇO ISSO ATÉ QUE NÃO SEJAM IGUAIS!

 indicemutacao = 1; # quantas mutacao eu vou fazer por individuo
 
 #### na mutacao, inicialmente vou me basear só no horario dos professores, como indice principal  de alteração
 ###Gerarei um individuo baseado na alteração por professores, outro pela alteração de salas
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
      
#Tabela das Mutações
#Mutação 1 = Realizar a troca do bloco inteiro do dia, ou seja, exemplo seria trocar a segunda pela sexta completamente;
#Na mutação 1 eu realizo dois sorteios, pra ver qual turma vou pegar do dia de origem e qual turma irei pegar do dia de destino;
#Mutação 2 = Realizar apenas a inversão da primeira aula da noite com a ultima aula da noite do dia sorteado;

#Primeiro devo verificar se há disciplina >100, pois se tiver, não será possível fazer sorteio, e o dias devem ser trocados inteiros;
#E claro, não há como fazer a mutação do tipo 2, portanto somente essa será feita
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
    #CASO NÃO TENHA MATÉRIA DUPLICADA EM NENHUM DOS DOIS DIAS SORTEADOS, VOU FAZER DOIS NOVOS SORTEIOS
    #UM SORTEIO PRA VER QUAL DISCIPLINA IREI PEGAR DO DIASORTEADO
    #OUTRO SORTEIO PRA VER QUAL DISCIPLINA IREI PEGAR DO NOVODIASORTEADO
    coeficientetroca1 = round(rand);
    coeficientetroca2 = round(rand);
    #AGORA QUE JÁ TENHO OS COEFICIENTE DE TROCA, VAMOS REALIZAR A TROCA
         auxsolo=pontusolucaoindividuo(turmasorteada+coeficientetroca1,diasorteado-2:diasorteado,individuoatual);
         pontusolucaoindividuo(turmasorteada+coeficientetroca1,diasorteado-2:diasorteado,individuoatual) = pontusolucaoindividuo(turmasorteada+coeficientetroca2,novodiasorteado-2:novodiasorteado,individuoatual);
         pontusolucaoindividuo(turmasorteada+coeficientetroca2,novodiasorteado-2:novodiasorteado,individuoatual)=auxsolo;
    endif
else 
    if(tipomutacao==2)
    #CASO A MUTACAO SEJA = 2, BASTA EU INVERTER A DISCIPLINA DO DIASORTEADO CASO, CLARO NÃO TENHA DISCIPLINA DUPLICADA    
          auxinverter = pontusolucaoindividuo(turmasorteada+1,diasorteado-2:diasorteado,individuoatual);
          pontusolucaoindividuo(turmasorteada+1,diasorteado-2:diasorteado,individuoatual) = pontusolucaoindividuo(turmasorteada,diasorteado-2:diasorteado,individuoatual);
          pontusolucaoindividuo(turmasorteada,diasorteado-2:diasorteado,individuoatual) = auxinverter;  
     endif    
endif      
  
  