#Inicializacao;


## Primeiro vou pontuar as salas cujo as disciplinas são maiores que 100
## Nesses casos a sala escolhida não pode estar na mesma coluna durante o resto do dia
## independente de qual for a aula ou professor, nesse caso receberá uma pontuação GRAVE (10000pts)
## As salas que tiverem incompatibilidade, armazenarei numa matriz com 3 colunas
## As colunas serão: Linha, Coluna, GrauIncompatibilidade

pontuacaosalas = zeros(50,3); #Atribui 15 linhas como uma estimativa para a quantidade de incompatibilidade de salas que podem ter
linhapontuacaosalas=1;
primeiravez = 1 ####Flag que armazena a posição original do problema.

for j=3:nprofessor_ndisciplinas_sala:nprofessor_ndisciplinas_sala*(dias) %18
    for i=1:nturmas*nduplasaula #i de 1-14
 primeiravez=1;  
        if ((solucaoinicial(i,j-1) > 100) && (solucaoinicial(i,j)>100))  ##########Realizo a contagem de penalidade das disciplinas > 100
##Encontrei uma discplina com uma sala >100, rodarei um for para saber se aquela sala esta sendo utilizada no mesmo dia
            for(p=i+1:nturmas*nduplasaula) 
              #primeiravez=1; 
              if(p+1)>15 break; 
            endif
                if(solucaoinicial(i,j)==solucaoinicial(p,j))
                    if(primeiravez==1)
                        pontuacaosalas(linhapontuacaosalas,1)=i; ##Armazeno a linha da incompatibilidade
                        pontuacaosalas(linhapontuacaosalas,2)=j; ##Armazeno a coluna da incompatibilidade
                        pontuacaosalas(linhapontuacaosalas,3)= 10000;    ##Armazeno a pontuacao da incompatibilidade
                        linhapontuacaosalas++;
                        primeiravez=0;
                    endif                    
                      pontuacaosalas(linhapontuacaosalas,1)=p; ##Armazeno a linha da incompatibilidade
                      pontuacaosalas(linhapontuacaosalas,2)=j; ##Armazeno a coluna da incompatibilidade
                      pontuacaosalas(linhapontuacaosalas,3)= 10000;    ##Armazeno a pontuacao da incompatibilidade
                      linhapontuacaosalas++;
                endif
             
            endfor

         elseif ((solucaoinicial(i,j-1)<100) && (solucaoinicial(i,j)>100))      
        #CASO a sala não esteja com uma disciplinas >100  e ela seja uma sala com numeracao > 100, realizo o mesmo teste nela           
        for(p=i+1:nturmas*nduplasaula)             
            if(p+1)>15 break;
            endif
                if(solucaoinicial(i,j)==solucaoinicial(p,j))
                      if((solucaoinicial(p,j-1) > 100) || (mod(i,2)==mod(p,2)))
                          if(primeiravez==1)
                          pontuacaosalas(linhapontuacaosalas,1)=i; ##Armazeno a linha da incompatibilidade
                          pontuacaosalas(linhapontuacaosalas,2)=j; ##Armazeno a coluna da incompatibilidade
                          pontuacaosalas(linhapontuacaosalas,3)=10000;    ##Armazeno a pontuacao da incompatibilidade
                          linhapontuacaosalas++;
                          primeiravez=0;
                          endif
                          pontuacaosalas(linhapontuacaosalas,1)=p; ##Armazeno a linha da incompatibilidade
                          pontuacaosalas(linhapontuacaosalas,2)=j; ##Armazeno a coluna da incompatibilidade
                          pontuacaosalas(linhapontuacaosalas,3)=10000;    ##Armazeno a pontuacao da incompatibilidade
                          linhapontuacaosalas++;                      
                      endif
                endif
             #primeiravez=0;   
            endfor
        endif      
    endfor
endfor    

 ###Aqui eu limpo a matriz de pontuação caso haja algum número duplicado
 pontsls= unique(pontuacaosalas,'rows');
 ###Removo os zeros
  idx2keep_columns = sum(abs(pontsls),1)>0 ;
  idx2keep_rows    = sum(abs(pontsls),2)>0 ;
 
 finalpontuacaosalas = pontsls(idx2keep_rows,idx2keep_columns);
 finalpontuacaosalas = sortrows(finalpontuacaosalas,2);