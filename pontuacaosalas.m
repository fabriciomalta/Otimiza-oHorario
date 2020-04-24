Inicializacao;


## Primeiro vou pontuar as salas cujo as disciplinas são maiores que 100
## Nesses casos a sala escolhida não pode estar na mesma coluna durante o resto do dia
## independente de qual for a aula ou professor, nesse caso receberá uma pontuação GRAVE (500pts)
## As salas que tiverem incompatibilidade, armazenarei numa matriz com 3 colunas
## As colunas serão: Linha, Coluna, GrauIncompatibilidade

pontuacaosalas = zeros(50,3); #Atribui 15 linhas como uma estimativa para a quantidade de incompatibilidade de salas que podem ter
linhapontuacaosalas=1;

for j=3:nprofessor_ndisciplinas_sala:nprofessor_ndisciplinas_sala*(dias) %18
    for i=1:nturmas*nduplasaula #i de 1-14
        if ((solucaoinicial(i,j-1) > 100) && (solucaoinicial(i,j)>100))  ##########Realizo a contagem de penalidade das disciplinas > 100
##Encontrei uma discplina >100, rodarei um for para saber se aquela sala esta sendo utilizada no mesmo dia
            for(p=i:nturmas*nduplasaula)        
            if(p+1)==15
            break;
            endif
                if(solucaoinicial(i,j)==solucaoinicial(p+1,j))
                      pontuacaosalas(linhapontuacaosalas,1)=p+1; ##Armazeno a linha da incompatibilidade
                      pontuacaosalas(linhapontuacaosalas,2)=j; ##Armazeno a coluna da incompatibilidade
                      pontuacaosalas(linhapontuacaosalas,3)= 500;    ##Armazeno a pontuacao da incompatibilidade
                      linhapontuacaosalas++;
                endif
            endfor
   elseif ((solucaoinicial(i,j-1)<100) && (solucaoinicial(i,j)>100))      
        #CASO a sala não esteja com uma disciplinas >100  e ela seja uma sala com numeracao > 100, realizo o mesmo teste nela           
        for(p=i:nturmas*nduplasaula)        
            if(p+2)>14
            break;
            endif
                if(solucaoinicial(i,j)==solucaoinicial(p+2,j))
                      if(solucaoinicial(p+2,j-1)>100)
                      pontuacaosalas(linhapontuacaosalas,1)=i; ##Armazeno a linha da incompatibilidade
                      pontuacaosalas(linhapontuacaosalas,2)=j; ##Armazeno a coluna da incompatibilidade
                      pontuacaosalas(linhapontuacaosalas,3)=500;    ##Armazeno a pontuacao da incompatibilidade
                      linhapontuacaosalas++;
                      else
                      pontuacaosalas(linhapontuacaosalas,1)=p+2; ##Armazeno a linha da incompatibilidade
                      pontuacaosalas(linhapontuacaosalas,2)=j; ##Armazeno a coluna da incompatibilidade
                      pontuacaosalas(linhapontuacaosalas,3)=500;    ##Armazeno a pontuacao da incompatibilidade
                      linhapontuacaosalas++;
                      endif
                endif
            endfor
        endif
        
    endfor
endfor    
