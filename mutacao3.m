  ## AQUI EU DESCUBRO QUEM � O INDIVIDUO QUE VOU MUTAR
  for cont = 1:numindividuos
   if((individuomutarsorteado)>=ponturanqueado(cont,5)&& individuomutarsorteado<=ponturanqueado(cont,6))
      individuomutar=ponturanqueado(cont,2);
   endif
  endfor
  # AQUI DCESCUBRO OS INDIVIDUOS QUE VOU RECOMBINAR, FA�O ISSO AT� QUE N�O SEJAM IGUAIS!


 nummutacoes = 1; # quantas mutacao eu vou fazer por individuo
 [row, column] = find(pontufitness(:,2) == individuomutar);
 #### na mutacao, inicialmente vou me basear s� no horario dos professores, como indice principal  de altera��o
 ###Gerarei um individuo baseado na altera��o por professores, outro pela altera��o de salas
 individuoatual=individuoatual+1;
 pontusolucaoindividuo(:,:,individuoatual)=pontusolucaoindividuo(:,:,row);
 colunadiasdasemana=[3,6,9,12,15,18];
 linhasturma=[1,3,5,7,9,11,13];
 aux=zeros(2,3);
 #for i = 1:indicemutacao

 #endfor
 
for j = 1:nummutacoes
  do
  diasorteado = colunadiasdasemana(randi(numel(colunadiasdasemana)));
  turmasorteada = linhasturma(randi(numel(linhasturma)));
  until(pontusolucaoindividuo(turmasorteada,diasorteado,individuoatual)!=-1);
  auxsolo=pontusolucaoindividuo(turmasorteada+1,diasorteado-2:diasorteado,individuoatual);
  pontusolucaoindividuo(turmasorteada+1,diasorteado-2:diasorteado,individuoatual) = pontusolucaoindividuo(turmasorteada,diasorteado-2:diasorteado,individuoatual);
  pontusolucaoindividuo(turmasorteada,diasorteado-2:diasorteado,individuoatual)=auxsolo; 
endfor

zap=1;