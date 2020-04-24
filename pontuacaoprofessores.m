Inicializacao;
pontuacaosalas;
### Primeiro vou pontuar os professores com o maior grau de incompatibilidade possível
### Ou seja, um professor não pode dar aula no mesmo bloco da noite ( em duas turmas antes do intervalo por exemplo)
### E claro, se ele estiver dando aula em uma disciplina maior que 100, obrigatoriamente não pode dar aula no mesmo dia a noite;

pontuacaoprofessores = zeros(50,3); #Atribui 50 linhas como uma estimativa para a quantidade de incompatibilidade de professores que podem ter
linhapontuacaoprofessores=1;

for j=1:nprofessor_ndisciplinas_sala:nprofessor_ndisciplinas_sala*(dias) %18
    for i=1:nturmas*nduplasaula #i de 1-14
        if ((solucaoinicial(i,j+1) > 100)) ##Encontrei uma aula que é maior que 100, logo o professor nao pode dar aula no mesmo dia
          for(p=i:nturmas*nduplasaula)        
            if(p+1)==15
            break;
            endif
                if(solucaoinicial(i,j)==solucaoinicial(p+1,j))
                      pontuacaoprofessores(linhapontuacaoprofessores,1)=p+1; ##Armazeno a linha da incompatibilidade
                      pontuacaoprofessores(linhapontuacaoprofessores,2)=j; ##Armazeno a coluna da incompatibilidade
                      pontuacaoprofessores(linhapontuacaoprofessores,3)=500;    ##Armazeno a pontuacao da incompatibilidade
                      linhapontuacaoprofessores++;
                endif
            endfor
        elseif ((solucaoinicial(i,j+1) < 100))
            for(p=i:2:nturmas*nduplasaula)        
              if(p+2)>14
              break;
              endif
                if((solucaoinicial(p+2,j+1)>100))
                      if((solucaoinicial(i,j)==solucaoinicial(p+1,j)) ||  (solucaoinicial(i,j)==solucaoinicial(p+3,j)))
                      pontuacaoprofessores(linhapontuacaoprofessores,1)=i; ##Armazeno a linha da incompatibilidade
                      pontuacaoprofessores(linhapontuacaoprofessores,2)=j; ##Armazeno a coluna da incompatibilidade
                      pontuacaoprofessores(linhapontuacaoprofessores,3)=500;    ##Armazeno a pontuacao da incompatibilidade
                      linhapontuacaoprofessores++;
                      endif
                endif                
                if(solucaoinicial(i,j)==solucaoinicial(p+2,j))
                      pontuacaoprofessores(linhapontuacaoprofessores,1)=p+2; ##Armazeno a linha da incompatibilidade
                      pontuacaoprofessores(linhapontuacaoprofessores,2)=j; ##Armazeno a coluna da incompatibilidade
                      pontuacaoprofessores(linhapontuacaoprofessores,3)=500;    ##Armazeno a pontuacao da incompatibilidade
                      linhapontuacaoprofessores++;
                endif
            endfor
        endif
      endfor
endfor