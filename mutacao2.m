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
 auxdupl=zeros(2,3);
 auxsolo=zeros(1,3);
 entrou=0;
 #for i = 1:indicemutacao

 #endfor
do 
    diasorteado = colunadiasdasemana(randi(numel(colunadiasdasemana)));
    novodiasorteado = colunadiasdasemana(randi(numel(colunadiasdasemana)));
 for i = 1:50
   #Pego cada incompatibilidade do dia da semana sorteado
   if ((pontuincompatibilidadesalas(i,2,individuomutar)==diasorteado) || pontuincompatibilidadeprof(i,2,individuomutar)==diasorteado)
     novodiasorteado = colunadiasdasemana(randi(numel(colunadiasdasemana)));
     entrou = 1;
     if(!isempty(pontuincompatibilidadesalas))
     l=pontuincompatibilidadesalas(i,1,individuomutar);
     else
     l=pontuincompatibilidadeprof(i,1,individuomutar);
     endif
     
     do
     novodiasorteado = colunadiasdasemana(randi(numel(colunadiasdasemana)));
     until ((pontusolucaoindividuo(l,novodiasorteado,individuoatual)!=-1));
     #Sorteio um novo dia para ser trocado a linha de incompatibilidade que acaba de ser sorteada

     #Verifico se a origem ou destino está em um dia que não pode ser utilizado.
     if((pontusolucaoindividuo(l,diasorteado,individuoatual)!=-1) && (pontusolucaoindividuo(l,novodiasorteado,individuoatual)!=-1))
          #troco as linhas de posicao, porem verifico se a disciplina é duplicada
       if((pontusolucaoindividuo(l,diasorteado-1,individuoatual)>=100) || (pontusolucaoindividuo(l,novodiasorteado-1,individuoatual)>=100))
           ## Caso ela seja duplicada, eu preciso trocar o bloco inteiro
          if(mod(l,2)==1) #vejo se ela está numa linha impar ou par
               auxdupl(1,:)=pontusolucaoindividuo(l,diasorteado-2:diasorteado,individuoatual);
               auxdupl(2,:)=pontusolucaoindividuo(l+1,diasorteado-2:diasorteado,individuoatual);
               
               pontusolucaoindividuo(l,diasorteado-2:diasorteado,individuoatual)= pontusolucaoindividuo(l,novodiasorteado-2:novodiasorteado,individuoatual);
               pontusolucaoindividuo(l+1,diasorteado-2:diasorteado,individuoatual)= pontusolucaoindividuo(l+1,novodiasorteado-2:novodiasorteado,individuoatual);
               
               pontusolucaoindividuo(l,novodiasorteado-2:novodiasorteado,individuoatual)=auxdupl(1,:);            
               pontusolucaoindividuo(l+1,novodiasorteado-2:novodiasorteado,individuoatual)=auxdupl(2,:);
          else
               auxdupl(1,:)=pontusolucaoindividuo(l-1,diasorteado-2:diasorteado,individuoatual);
               auxdupl(2,:)=pontusolucaoindividuo(l,diasorteado-2:diasorteado,individuoatual);
               
               pontusolucaoindividuo(l-1,diasorteado-2:diasorteado,individuoatual)= pontusolucaoindividuo(l-1,novodiasorteado-2:novodiasorteado,individuoatual);
               pontusolucaoindividuo(l,diasorteado-2:diasorteado,individuoatual)= pontusolucaoindividuo(l,novodiasorteado-2:novodiasorteado,individuoatual);
               
               pontusolucaoindividuo(l-1,novodiasorteado-2:novodiasorteado,individuoatual)=auxdupl(1,:);
               pontusolucaoindividuo(l,novodiasorteado-2:novodiasorteado,individuoatual)=auxdupl(2,:);
          endif
       else
       jogamoeda = randi(1);
       #JOGO UMA MOEDA PORQUE, PORQUE AS VEZES EU TROCO O DIA COM OUTRO OU SIMPLESMENTE INVERTO OS HORÁRIOS
       
       #if(jogamoeda<=0.5)           
         auxsolo=pontusolucaoindividuo(l,diasorteado-2:diasorteado,individuoatual);
         pontusolucaoindividuo(l,diasorteado-2:diasorteado,individuoatual) = pontusolucaoindividuo(l,novodiasorteado-2:novodiasorteado,individuoatual);
         pontusolucaoindividuo(l,novodiasorteado-2:novodiasorteado,individuoatual)=auxsolo;
       #else
       ##AQUI EU VOU INVERTER O HORÁRIO DO DIA, pq as vezes simplesmente é o que precisa, vou sortear qual vou trocar, se é o dia sorteado ou o novo        
         sorteio=rand(1); 
         if(sorteio<=0.5)
         diainverter = diasorteado;
         else
         diainverter = novodiasorteado;
         endif
         
         if(mod(l,2)==1)
          auxinverter = pontusolucaoindividuo(l+1,diainverter-2:diainverter,individuoatual);
          pontusolucaoindividuo(l+1,diainverter-2:diainverter,individuoatual) = pontusolucaoindividuo(l,diainverter-2:diainverter,individuoatual);
          pontusolucaoindividuo(l,diainverter-2:diainverter,individuoatual) = auxinverter;
         else
          auxinverter = pontusolucaoindividuo(l-1,diainverter-2:diainverter,individuoatual);
          pontusolucaoindividuo(l-1,diainverter-2:diainverter,individuoatual) = pontusolucaoindividuo(l,diainverter-2:diainverter,individuoatual);
          pontusolucaoindividuo(l,diainverter-2:diainverter,individuoatual) = auxinverter;
         endif
       #endif
       
      endif
      endif
    endif
 endfor
until(entrou!=0);