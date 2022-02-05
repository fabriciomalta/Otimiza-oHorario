  for cont = 1:numindividuos
   if((individuomutarsorteado)>=ponturanqueado(cont,5)&& individuomutarsorteado<=ponturanqueado(cont,6))
      individuomutar=ponturanqueado(cont,2);
   endif
  endfor
 indicemutacao = 1; 
 individuoatual=individuoatual+1;
 pontusolucaoindividuo(:,:,individuoatual)=pontusolucaoindividuo(:,:,individuomutar);
 colunadiasdasemana=[3,6,9,12,15,18];
 turmas=[1,3,5,7,9,11,13];
 auxdupl=zeros(2,3);
 auxsolo=zeros(1,3);
 entrou=0;
 tipomutacao = randi(2);
do 
    diasorteado = colunadiasdasemana(randi(numel(colunadiasdasemana)));
    novodiasorteado = colunadiasdasemana(randi(numel(colunadiasdasemana)));
    turmasorteada = turmas(randi(numel(turmas)));
until ((diasorteado!=novodiasorteado) && (pontusolucaoindividuo(turmasorteada,diasorteado,individuoatual)!=-1) && (pontusolucaoindividuo(turmasorteada,novodiasorteado,individuoatual)!=-1))
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
    coeficientetroca1 = round(rand);
    coeficientetroca2 = round(rand);
         auxsolo=pontusolucaoindividuo(turmasorteada+coeficientetroca1,diasorteado-2:diasorteado,individuoatual);
         pontusolucaoindividuo(turmasorteada+coeficientetroca1,diasorteado-2:diasorteado,individuoatual) = pontusolucaoindividuo(turmasorteada+coeficientetroca2,novodiasorteado-2:novodiasorteado,individuoatual);
         pontusolucaoindividuo(turmasorteada+coeficientetroca2,novodiasorteado-2:novodiasorteado,individuoatual)=auxsolo;
    endif
else 
    if(tipomutacao==2)   
          auxinverter = pontusolucaoindividuo(turmasorteada+1,diasorteado-2:diasorteado,individuoatual);
          pontusolucaoindividuo(turmasorteada+1,diasorteado-2:diasorteado,individuoatual) = pontusolucaoindividuo(turmasorteada,diasorteado-2:diasorteado,individuoatual);
          pontusolucaoindividuo(turmasorteada,diasorteado-2:diasorteado,individuoatual) = auxinverter;  
     endif    
endif      
  
  