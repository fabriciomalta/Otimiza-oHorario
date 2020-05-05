#bcdefgoijkmptwyz
#xx ohl

DadosDeEntrada;
Disciplinas;
Inicializacao;

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

diasemana1 = 1;
diasemana2 = 1;
##  1=segunda
##  2=terça
##  3=quarta
##  4=quinta
##  5=sexta
##  6=sab

pontuacaofpa = zeros(30,4); #Atribui 15 linhas como uma estimativa para a quantidade de incompatibilidade de salas que podem ter
#COLUNA 1 REPRESENTA A  LINHA E A COLUNA 2 REPRESENTA A COLUNA, NA MATRIZ SOLUCAOINICIAL
linhapontuacaofpa=1;


for xx=17:22 #PERCORRE AS COLUNAS DA MATRIZ DE ENTRADA
  
      for l=1:21#PERCORRE AS LINHAS DA MATRIZ DE ENTRADA( CADA LINHA É O NUMERO DO PROFESSOR)
        
            for o=1:nprofessor_ndisciplinas_sala:nprofessor_ndisciplinas_sala*(dias) #COLUNAS SOLUCAOINICIAL 18 DE 3 EM 3
                 
                 for h=1:nturmas*nduplasaula #i de 1-14 LINHAS MATRIZ SOLUCAOINICIAL 
                   
                        if( solucaoinicial(h,o)==l  && diasemana1==diasemana2 && dadosdeentrada(l,xx)==0)
                        pontuacaofpa(linhapontuacaofpa,1)=h;
                        pontuacaofpa(linhapontuacaofpa,2)=o;
                        pontuacaofpa(linhapontuacaofpa,3)= diasemana1;
                        pontuacaofpa(linhapontuacaofpa,4)= 500;
                        linhapontuacaofpa++;
                        endif;
                      
                  endfor
                diasemana2++; ##FLAG PARA INDICAR O DIA DA SEMANA DA SOLUCAOINICIAL O
            endfor
                diasemana2=1;
        endfor;
    diasemana1++; ##FLAG PARA INDICAR O DIA DA SEMANA DA MATRIZ DE ENTRADA  XX
    
endfor;

pontuacaofpa;


   

