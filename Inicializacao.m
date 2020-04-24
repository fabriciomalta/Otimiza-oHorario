Disciplinas;
DadosDeEntrada;

nturmas = 7; #Toda as turmas 
nduplasaula=2;
dias=6; #dias da semana que tem aula
nprofessor_ndisciplinas_sala = 3;
nturmasaut=4; %turmas da automação
sabaut=1; %aulas de sabado na automação: 1-não; 0-sim
sabmec=0; %aulas de sabado na mecatronica: 1-não; 0-sim
nmaxdisciplinasporturma=20;
solucaoinicial=zeros(nduplasaula*nturmas,dias*nprofessor_ndisciplinas_sala); #14x18
#solucaoinicial2=zeros(dias*nprofessor_ndisciplinas_sala,nduplasaula*nturmas);#18x14
######

if sabaut==1
    for i=1:nturmasaut*nduplasaula
      for t=(dias-1)*nprofessor_ndisciplinas_sala+1:dias*nprofessor_ndisciplinas_sala
        solucaoinicial(i,t)=-1;
      endfor
    endfor
endif
%se n tiver aulasaut de sabado vai atribuir -1 na solucaoinicial

if sabmec==1
    for i=nturmasaut*nduplasaula+1:nduplasaula*nturmas;
      for t=(dias-1)*nprofessor_ndisciplinas_sala+1:dias*nprofessor_ndisciplinas_sala
        solucaoinicial(i,t)=-1;
      endfor
    endfor
endif 
%se n tiver aulasmec de sabado vai atribuir -1 na solucaoinicial

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##GERAÇÃO DA SOLUÇÃO INICIAL DE MANEIRA ALEATÓRIA####


auxaulascargas=aulascargas;
auxdisciplinas=zeros(nturmas,nmaxdisciplinasporturma); #tam= 7x10
#Onde 10 é a quantidade máxima de disciplinas em um sem.
%%separou quais disciplinas são lecionados em cada semestre
contador=1;
flagatrib=1;
segundavez=0;


while flagatrib~=0
  flagatrib=0;
    for i=1:nturmas # para 1-7
          for t=1:c; #para 1-c=55
            #se as aulascargas(1-55,semestre) for=i
            if aulascargas(t,3) == i && auxaulascargas(t,2)~=0 
              while (segundavez ==1) && (auxdisciplinas(i,contador) ~= 0)
                contador = contador + 1;
              endwhile
              if(segundavez==1 && aulascargas(t,1)>100)
                 break;
              endif
                auxdisciplinas(i,contador)=aulascargas(t,1); #matriz 7x10          
                contador = contador + 1; 
                auxaulascargas(t,2) = auxaulascargas(t,2)-2;
                flagatrib=1;
            endif;      
           endfor; 
            contador = 1;
     endfor;
     segundavez=1;
endwhile
 ########### MATRIZ DE ASSOCIAÇÃO DE DISCIPLINA A CADA SEMESTRE CRIADA#####
 
 #### Sorteio dos valores######

 k=1;
 
 %auxmatsort;
 for i=1:nturmas #de 1-7
   vetorsorteio=0;
    p=0;
      for t=1:nmaxdisciplinasporturma #para t de 1-10
         if auxdisciplinas(i,t)>0 #se auxdisciplinas tem materia
            p=p+1;
            %%ver quantas posições diferente de zero eu tenho
         endif;
      endfor;
       vetorsorteio=randperm(p,p);
      %geracao da solucao inicial
         z=1;
         for y=1:nduplasaula %1 ate 2
                for m=2:nprofessor_ndisciplinas_sala:nprofessor_ndisciplinas_sala*(dias) %1 ate 3*6
                   if z<=p
                     if solucaoinicial(k,m)==-1 %apenas preenche se n houver restrição
                       else
                          solucaoinicial(k,m)=auxdisciplinas(i,vetorsorteio(z)); %solucao inicial preenchida de 2 em 2 linhas,  com base nas posições do vetorsorteio
                          ### SUBTRAIR CARGA HORÁRIA DEPOIS DE ATRIBUIÇÃO ###
                          z=z+1;
                       endif
                   endif
                endfor
               k=k+1;
          endfor
 endfor;
 
flag=0;

for i=1:nturmas*nduplasaula
  for k=2:nprofessor_ndisciplinas_sala:nprofessor_ndisciplinas_sala*(dias)
    if solucaoinicial(i,k)>=100 ### ESTUDAR GENERALIZAÇÃO 
          if mod(i,2)==0 %checagem de par
            aux1=solucaoinicial(i-1,k);
            if solucaoinicial(i-1,k)~=solucaoinicial(i,k)
               solucaoinicial(i-1,k)=solucaoinicial(i,k);
              if aux1~=0
                for w=nprofessor_ndisciplinas_sala*dias-1:-nprofessor_ndisciplinas_sala:2
                    if solucaoinicial(i,w)==0 && flag==0 
                      solucaoinicial(i,w)=aux1;
                      flag=1;
                    endif 
                endfor
              endif
            endif
           else %impar       
            aux2=solucaoinicial(i+1,k);
            if solucaoinicial(i+1,k)~=solucaoinicial(i,k)
                    solucaoinicial(i+1,k)=solucaoinicial(i,k);
              if aux2~=0 
                for w=nprofessor_ndisciplinas_sala*dias-1:-nprofessor_ndisciplinas_sala:2 
                    if solucaoinicial(i+1,w)==0 && flag==0 
                      solucaoinicial(i+1,w)=aux2;
                      flag=1;
                     endif
                endfor
              endif
            endif
        endif
        flag=0;
    endif  
  endfor 
endfor

for i=1:nturmas*nduplasaula
  for k=2:nprofessor_ndisciplinas_sala:nprofessor_ndisciplinas_sala*(dias)
    if(mod(i,2)==0 && solucaoinicial(i,k)>100)
      solucaoinicial(i,k)=solucaoinicial(i,k)-1;
    endif
  endfor 
endfor

#INSERINDO A MATRIZ DE ENTRADA 
for i=1:nturmas*nduplasaula #i de 1-14
    for j=2:nprofessor_ndisciplinas_sala:nprofessor_ndisciplinas_sala*(dias) %18
              for k=1:21 
                         for y=2:2:16
                                    %se for <100
                                    if(dadosdeentrada(k,y)==1 && dadosdeentrada(k,y)<100 && solucaoinicial(i,j)~=-1)
                                            if (dadosdeentrada(k,y-1) == solucaoinicial(i,j))
                                                solucaoinicial(i,j-1) = k;
                                                solucaoinicial(i,j+1) = dadosdeentrada(k,y);
                                    
                                            endif
                                     else %>100
                                            if(dadosdeentrada(k,y)>100 && solucaoinicial(i,j)~=-1 && dadosdeentrada(k,y-1) == solucaoinicial(i,j))
                                                  solucaoinicial(i,j-1) = k;
                                                  solucaoinicial(i,j+1) = dadosdeentrada(k,y);
                                            %coloca um rand para alocar as de >100 sorteiando os 2 professor?
                                            endif
                                   endif
                          endfor
                     flag=0;
              endfor
     endfor
endfor 


#VERIFICADOR DE ERROS DAS SALAS
#VERIFICAR SALAS IGUAIS >100 COM DISCIPLINAS > 100
#VERIFICAR SALA IGUAIS >100 COM DISCIPLINAS <100
#VERIFICAR PROFESSORES IGUAIS 
#VERIFICAR FPA 
#PEGAR POSIÇÃO DO VETOR DA PENALIDADE

solucaoinicial


