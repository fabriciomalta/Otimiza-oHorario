#### para saber qual individuo eu irei escolher, eu irei fazer um sorteio da seguinte format
#### PEGAREI OS ULTIMOS 10 INDIVIDUSO GERADOS, JÁ QUE ELES PERTENCERÃO A ULTIMA POPULAÇÃO GERADA
#### Farei um SORTEIO DA SEGUInte forma, um sorteio de 0 a 100, onde a probabilidade de cair o individuo mais apto é maior
#SORTEAR UM NUMERO DE 0 A 100
#20% de cair melhor individuo 1-20 1
#19% de cair no segundo melhor individuo 21-39 2
#17- 40-56 3
#11- 57-67 4
#10 - 68-77
#8 - 78-85
#6 - 86 - 91
#5 92-96
#3 97-99
#1% chance de cair pior individuo 100-100 
#ABAIXO EU REORGANIZO MEUS ULTIMOS 10 INDIVIDUOS FEITOS COM BASE NA MENOR PONTUAÇÃO ENTRE ELES
ponturanqueado=zeros(200,2);
ponturanqueado(geracao-9:geracao,1:2)=sortrows(pontufitness(geracao-9:geracao,1:2));
#SORTEIO UM INDIVIDUO PARA APLICAR A MUTAÇÃO E DEPOIS SORTEIO DOIS PARA APLICAR CROSSOVER

individuomutarsorteado=randi(100);
individuoscrossorteado=randi(100,1:2);
#OBTER O INDIVIDUO SORTEADO MUTAR ATRAVÉS DO METODO ROLETA
if(individuomutarsorteado<=20)
{
individuomutar=ponturanqueado(geracao-9,2);
}
elseif(individuomutarsorteado>=21 && individuomutarsorteado<=39)
{
individuomutar=ponturanqueado(geracao-8,2);
}elseif(individuomutarsorteado>=40 && individuomutarsorteado<=56)
{
individuomutar=ponturanqueado(geracao-7,2);
}elseif(individuomutarsorteado>=57 && individuomutarsorteado<=67)
{
individuomutar=ponturanqueado(geracao-6,2);
}elseif(individuomutarsorteado>=68 && individuomutarsorteado<=77)
{
individuomutar=ponturanqueado(geracao-5,2);
}elseif(individuomutarsorteado>=78 && individuomutarsorteado<=85)
{
individuomutar=ponturanqueado(geracao-4,2);
}elseif(individuomutarsorteado>=86 && individuomutarsorteado<=91)
{
individuomutar=ponturanqueado(geracao-3,2);
}elseif(individuomutarsorteado>=92 && individuomutarsorteado<=96)
{
individuomutar=ponturanqueado(geracao-2,2);
}elseif(individuomutarsorteado>=97 && individuomutarsorteado<=99)
{
individuomutar=ponturanqueado(geracao-1,2);
}else{
individuomutar=ponturanqueado(geracao,2);
}
endif;

#OBTER O 1 INDIVIDUOS SORTEADOS CROSSOVER ATRAVÉS DO METODO ROLETA
if(individuoscrossorteado(1,1)<=20)
{
individuocross1=ponturanqueado(geracao-9,2);
}elseif(individuoscrossorteado(1,1)>=21 && individuoscrossorteado(1,1)<=39)
{
individuocross1=ponturanqueado(geracao-8,2);
}elseif(individuoscrossorteado(1,1)>=40 && individuoscrossorteado(1,1)<=56)
{
individuocross1=ponturanqueado(geracao-7,2);
}elseif(individuoscrossorteado(1,1)>=57 && individuoscrossorteado(1,1)<=67)
{
individuocross1=ponturanqueado(geracao-6,2);
}elseif(individuoscrossorteado(1,1)>=68 && individuoscrossorteado(1,1)<=77)
{
individuocross1=ponturanqueado(geracao-5,2);
}elseif(individuoscrossorteado(1,1)>=78 && individuoscrossorteado(1,1)<=85)
{
individuocross1=ponturanqueado(geracao-4,2);
}elseif(individuoscrossorteado(1,1)>=86 && individuoscrossorteado(1,1)<=91)
{
individuocross1=ponturanqueado(geracao-3,2);
}elseif(individuoscrossorteado(1,1)>=92 && individuoscrossorteado(1,1)<=96)
{
individuocross1=ponturanqueado(geracao-2,2);
}elseif(individuoscrossorteado(1,1)>=97 && individuoscrossorteado(1,1)<=99)
{
individuocross1=ponturanqueado(geracao-1,2);
}else{
individuocross1=ponturanqueado(geracao,2);
}
endif;
#####OBTER O 2 INDIVIDUOS SORTEADOS CROSSOVER ATRAVÉS DO METODO ROLETA
#SE OS INDIVIDUOS FOREM IGUAIS NO  CROSSOVER, EU SORTEIO NOVAMENTE
do
  individuoscrossorteado=randi(100,1:2);
  if(individuoscrossorteado(1,2)<=20)
  {
individuocross2=ponturanqueado(geracao-9,2);
}elseif(individuoscrossorteado(1,2)>=21 && individuoscrossorteado(1,2)<=39)
{
individuocross2=ponturanqueado(geracao-8,2);
}elseif(individuoscrossorteado(1,2)>=40 && individuoscrossorteado(1,2)<=56)
{
individuocross2=ponturanqueado(geracao-7,2);
}elseif(individuoscrossorteado(1,2)>=57 && individuoscrossorteado(1,2)<=67)
{
individuocross2=ponturanqueado(geracao-6,2);
}elseif(individuoscrossorteado(1,2)>=68 && individuoscrossorteado(1,2)<=77)
{
individuocross2=ponturanqueado(geracao-5,2);
}elseif(individuoscrossorteado(1,2)>=78 && individuoscrossorteado(1,2)<=85)
{
individuocross2=ponturanqueado(geracao-4,2);
}elseif(individuoscrossorteado(1,2)>=86 && individuoscrossorteado(1,2)<=91)
{
individuocross2=ponturanqueado(geracao-3,2);
}elseif(individuoscrossorteado(1,2)>=92 && individuoscrossorteado(1,2)<=96)
{
individuocross2=ponturanqueado(geracao-2,2);
}elseif(individuoscrossorteado(1,2)>=97 && individuoscrossorteado(1,2)<=99)
{
individuocross2=ponturanqueado(geracao-1,2);
}else
{
individuocross2=ponturanqueado(geracao,2);
}
endif;
until(individuocross1!=individuocross2);
