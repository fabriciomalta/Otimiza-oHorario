#Inicializacao;
#pontuacaosalas;
#pontuacaofpa;

### Primeiro vou pontuar os professores com o maior grau de incompatibilidade possï¿½vel
### Ou seja, um professor nï¿½o pode dar aula no mesmo bloco da noite ( em duas turmas antes do intervalo por exemplo)
### E claro, se ele estiver dando aula em uma disciplina maior que 100, obrigatoriamente nï¿½o pode dar aula no mesmo dia a noite;

pontuacaoprofessores = zeros(50,3); #Atribui 50 linhas como uma estimativa para a quantidade de incompatibilidade de professores que podem ter
linhapontuacaoprofessores=1;

for j=1:nprofessor_ndisciplinas_sala:nprofessor_ndisciplinas_sala*(dias) %18
    for i=1:nturmas*nduplasaula #i de 1-14
 primeiravez=1;  
        if ((solucaoinicial(i,j+1) > 100) &&(solucaoinicial(i,j+1) != -1))  ##########Realizo a contagem de penalidade das disciplinas > 100
##Encontrei uma discplina com uma sala >100, rodarei um for para saber se aquela sala esta sendo utilizada no mesmo dia
            for(p=i+1:nturmas*nduplasaula) 
              #primeiravez=1; 
              if(p+1)>15 break; 
            endif
                if(solucaoinicial(i,j)==solucaoinicial(p,j))
                    if(primeiravez==1)
                        pontuacaoprofessores(linhapontuacaoprofessores,1)=i; ##Armazeno a linha da incompatibilidade
                        pontuacaoprofessores(linhapontuacaoprofessores,2)=j; ##Armazeno a coluna da incompatibilidade
                        pontuacaoprofessores(linhapontuacaoprofessores,3)= 10000;    ##Armazeno a pontuacao da incompatibilidade
                        linhapontuacaoprofessores++;
                        primeiravez=0;
                    endif                    
                      pontuacaoprofessores(linhapontuacaoprofessores,1)=p; ##Armazeno a linha da incompatibilidade
                      pontuacaoprofessores(linhapontuacaoprofessores,2)=j; ##Armazeno a coluna da incompatibilidade
                      pontuacaoprofessores(linhapontuacaoprofessores,3)= 10000;    ##Armazeno a pontuacao da incompatibilidade
                      linhapontuacaoprofessores++;
                endif
             
            endfor

         elseif ((solucaoinicial(i,j+1)<100) &&(solucaoinicial(i,j+1) != -1))      
        #CASO o professor não esteja com uma disciplinas >100 realizo o mesmo teste nela           
        for(p=i+1:nturmas*nduplasaula)             
            if(p+1)>15 break;
            endif
                if(solucaoinicial(i,j)==solucaoinicial(p,j))
                      if((solucaoinicial(p,j+1) > 100) || (mod(i,2)==mod(p,2)))
                          if(primeiravez==1)
                          pontuacaoprofessores(linhapontuacaoprofessores,1)=i; ##Armazeno a linha da incompatibilidade
                          pontuacaoprofessores(linhapontuacaoprofessores,2)=j; ##Armazeno a coluna da incompatibilidade
                          pontuacaoprofessores(linhapontuacaoprofessores,3)=10000;    ##Armazeno a pontuacao da incompatibilidade
                          linhapontuacaoprofessores++;
                          primeiravez=0;
                          endif
                          pontuacaoprofessores(linhapontuacaoprofessores,1)=p; ##Armazeno a linha da incompatibilidade
                          pontuacaoprofessores(linhapontuacaoprofessores,2)=j; ##Armazeno a coluna da incompatibilidade
                          pontuacaoprofessores(linhapontuacaoprofessores,3)=10000;    ##Armazeno a pontuacao da incompatibilidade
                          linhapontuacaoprofessores++;                      
                      endif
                endif
             #primeiravez=0;   
            endfor
        endif      
    endfor
endfor    


################### Verificao se professor esta dando aula no ultimo bloco da sexta e no primeiro bloco do sabado
####### Os professores da linha 14,12,10 coluna 13  Nao podem dar aula nas linhas 9,11,13 da coluna 16

######Alterar e colocar genérico
for(p=10:2:14)
    for(j=10:2:14)
        if(solucaoinicial(p,13) == solucaoinicial(j-1,16))
            pontuacaoprofessores(linhapontuacaoprofessores,1)=j-1;
            pontuacaoprofessores(linhapontuacaoprofessores,2)=16;
            pontuacaoprofessores(linhapontuacaoprofessores,3)=10002;           
        endif
    endfor
endfor

 pontuacaoprofessores;
 ###Aqui eu limpo a matriz de pontuação caso haja algum número duplicado
 pontpfs= unique(pontuacaoprofessores,'rows');
 ###Removo os zeros
  idx2keep_columns = sum(abs(pontpfs),1)>0 ;
  idx2keep_rows    = sum(abs(pontpfs),2)>0 ;
 
 finalpontuacaoprofessores = pontpfs(idx2keep_rows,idx2keep_columns);
 if(finalpontuacaoprofessores)
 finalpontuacaoprofessores = sortrows(finalpontuacaoprofessores,2);
 endif
 
 
 