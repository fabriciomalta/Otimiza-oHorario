  Inicializacao;
  pontuacaoprofessores;
  
  ##COMPARAR O FPA COM OS DIAS QUE OS PROFESSORES ESTÃO
  ##LOGO COMPARAR A COLUNAS 1,4,7,10,13,16 DA solucaoinicial COM A MATRIZ DE ENTRADA
  ##IMCOMPATIBILIDADE DE DIAS SERA ATRIBUIDA UM PENALIDADE DE 500
  
  ##MATRIZDEENTRADA:
  ##17=SEGUNDA
  ##18=TERÇA
  ##19=QUARTA
  ##20=QUINTA
  ##21=SEXTA
  ##22=SABADO
  
  ##SOLUCAOINICIAL
  ##1=SEGUNDA
  ##4=TERÇA
  ##7=QUARTA
  ##10=QUINTA
  ##13=SEXTA
  ##16=SABADO


  diasemana = 0;
##  1=segunda
##  2=terça
##  3=quarta
##  4=quinta
##  5=sexta
##  6=sab
  
  pontuacaofpa = zeros(30,3); #Atribui 15 linhas como uma estimativa para a quantidade de incompatibilidade de salas que podem ter
  #COLUNA 1 REPRESENTA A  LINHA E A COLUNA 2 REPRESENTA A COLUNA, NA MATRIZ SOLUCAOINICIAL
  
  for j=1:nprofessor_ndisciplinas_sala:nprofessor_ndisciplinas_sala*(dias) %18
     for i=1:nturmas*nduplasaula #i de 1-14 
      for m=17:22 #PERCORRE AS COLUNAS DA MATRIZ DE ENTRADA
            for n=1:21 #PERCORRE AS LINHAS DA MATRIZ DE ENTRADA
                        
                        
                         if( solucaoinicial(i,1) && dadosentrada(m,17))
                         diasemana=1;
                             
                          endif;      
                        
##                  if( solucaoinicial(i,j) == n && dadosentrada(m,n) )
                        if( )
                        endif;
##                  endif;
  
  
  
            endfor
       endfor
     
  
        
     endfor;
  endfor;
  
  
  
