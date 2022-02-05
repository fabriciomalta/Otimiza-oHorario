Variaveis;
if sabaut==1
    for i=1:nturmasaut*nduplasaula
      for t=(dias-1)*nprofessor_ndisciplinas_sala+1:dias*nprofessor_ndisciplinas_sala
        solucaoinicial(i,t)=-1;
      endfor
    endfor
endif
if sabmec==1
    for i=nturmasaut*nduplasaula+1:nduplasaula*nturmas;
      for t=(dias-1)*nprofessor_ndisciplinas_sala+1:dias*nprofessor_ndisciplinas_sala
        solucaoinicial(i,t)=-1;
      endfor
    endfor
endif 

auxaulascargas=aulascargas;
auxdisciplinas=zeros(nturmas,nmaxdisciplinasporturma); #tam= 7x10
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

 k=1;
 
 for i=1:nturmas
   vetorsorteio=0;
    p=0;
      for t=1:nmaxdisciplinasporturma
         if auxdisciplinas(i,t)>0 
            p=p+1;

         endif;
      endfor;
       vetorsorteio=randperm(p,p);
         z=1;
         for y=1:nduplasaula 
                for m=2:nprofessor_ndisciplinas_sala:nprofessor_ndisciplinas_sala*(dias) %1 ate 3*6
                   if z<=p
                     if solucaoinicial(k,m)==-1 
                       else
                          solucaoinicial(k,m)=auxdisciplinas(i,vetorsorteio(z)); 
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
    if solucaoinicial(i,k)>=100 ### ESTUDAR GENERALIZA��O 
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
                                    
                                    if(dadosdeentrada(k,y)==1 && dadosdeentrada(k,y)<100 && solucaoinicial(i,j)~=-1)
                                            if (dadosdeentrada(k,y-1) == solucaoinicial(i,j))
                                                solucaoinicial(i,j-1) = k;
                                                solucaoinicial(i,j+1) = dadosdeentrada(k,y);
                                    
                                            endif
                                     else 
                                            if(dadosdeentrada(k,y)>100 && solucaoinicial(i,j)~=-1 && dadosdeentrada(k,y-1) == solucaoinicial(i,j))
                                                  solucaoinicial(i,j-1) = k;
                                                  solucaoinicial(i,j+1) = dadosdeentrada(k,y);
                                            
                                            endif
                                   endif
                          endfor
                     flag=0;
              endfor
     endfor
endfor 

