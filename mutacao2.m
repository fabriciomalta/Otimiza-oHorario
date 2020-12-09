 indicemutacao = 1; # quantas mutacao eu vou fazer por individuo
 
 #### na mutacao, inicialmente vou me basear só no horario dos professores, como indice principal  de alteração
 ###Gerarei um individuo baseado na alteração por professores, outro pela alteração de salas
 individuoatual=individuoatual+1;
 pontusolucaoindividuo(:,:,individuoatual)=pontusolucaoindividuo(:,:,individuomutar);
 colunadiasdasemana=[1,4,7,10,13,16];
 auxdupl=zeros(2,3);
 auxsolo=zeros(1,3);
 for i = 1:indicemutacao
    diasorteado = colunadiasdasemana(randi(numel(colunadiasdasemana)));
 endfor

 for i = 1:50
   #Pego cada incompatibilidade do dia da semana sorteado
   
   if (pontuincompatibilidadesalas(i,2,individuoatual)==diasorteado)
     l=pontuincompatibilidadesalas(i,1,individuoatual)
     do
     novodiasorteado = colunadiasdasemana(randi(numel(colunadiasdasemana)))
     until (pontusolucaoindividuo(l,novodiasorteado,individuoatual)!=-1);
     #Sorteio um novo dia para ser trocado a linha de incompatibilidade que acaba de ser sorteada

     #Verifico se a origem ou destino está em um dia que não pode ser utilizado.
     if((pontusolucaoindividuo(l,diasorteado,individuoatual)!=-1) && (pontusolucaoindividuo(l,novodiasorteado,individuoatual)!=-1))
          #troco as linhas de posicao, porem verifico se a disciplina é duplicada
       if((pontusolucaoindividuo(l,diasorteado+1,individuoatual)>=100) || (pontusolucaoindividuo(l,novodiasorteado+1,individuoatual)>=100))
          if(mod(l,2)==1)
               auxdupl(1,:)=pontusolucaoindividuo(l,diasorteado:diasorteado+2,individuoatual);
               auxdupl(2,:)=pontusolucaoindividuo(l+1,diasorteado:diasorteado+2,individuoatual);
               pontusolucaoindividuo(l,diasorteado:diasorteado+2,individuoatual)= pontusolucaoindividuo(l,novodiasorteado:novodiasorteado+2,individuoatual);
               pontusolucaoindividuo(l+1,diasorteado:diasorteado+2,individuoatual)= pontusolucaoindividuo(l+1,novodiasorteado:novodiasorteado+2,individuoatual);
               pontusolucaoindividuo(l,novodiasorteado:novodiasorteado+2,individuoatual)=auxdupl(1,:);
               pontusolucaoindividuo(l+1,novodiasorteado:novodiasorteado+2,individuoatual)=auxdupl(2,:);
          else
               auxdupl(1,:)=pontusolucaoindividuo(l-1,diasorteado:diasorteado+2,individuoatual);
               auxdupl(2,:)=pontusolucaoindividuo(l,diasorteado:diasorteado+2,individuoatual);
               pontusolucaoindividuo(l-1,diasorteado:diasorteado+2,individuoatual)= pontusolucaoindividuo(l-1,novodiasorteado:novodiasorteado+2,individuoatual);
               pontusolucaoindividuo(l,diasorteado:diasorteado+2,individuoatual)= pontusolucaoindividuo(l,novodiasorteado:novodiasorteado+2,individuoatual);
               pontusolucaoindividuo(l-1,novodiasorteado:novodiasorteado+2,individuoatual)=auxdupl(1,:);
               pontusolucaoindividuo(l,novodiasorteado:novodiasorteado+2,individuoatual)=auxdupl(2,:);
          endif
       endif
       else
       auxsolo=pontusolucaoindividuo(l,diasorteado:diasorteado+2,individuoatual);
       pontusolucaoindividuo(l,diasorteado:diasorteado+2,individuoatual) = pontusolucaoindividuo(l,novodiasorteado:novodiasorteado+2,individuoatual)
       pontusolucaoindividuo(l,novodiasorteado:novodiasorteado+2,individuoatual)=auxsolo
      endif
    endif
 endfor