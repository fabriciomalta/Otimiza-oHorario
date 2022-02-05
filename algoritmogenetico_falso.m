Variaveis;
populacaototal=3000; 
numindividuos=10;
pontusolucaoindividuo=zeros(nduplasaula*nturmas,dias*nprofessor_ndisciplinas_sala,limpa);
pontuincompatibilidadeprof=zeros(50,3,limpa);
pontuincompatibilidadesalas=zeros(50,3,limpa);
aptos=zeros(5000,2);
aptos(1, 1)= 999999;
pontuacaofpa = zeros(30,4);

pontufitness = zeros(limpa,2);
populacaoinicial;

geracao=numindividuos; #Controle de geracao, cada geracao é formado pela quantidade de numindivididuos
taxamutacao = 0.55;
taxacrossover = 0.50;;

pessoasgeradas=numindividuos;
selecao;
do
  individuomutarsorteado=rand(1);
  chancemutar=rand(1); 
  if(chancemutar<=taxamutacao) 
    mutacao;
    fitness;
    pontufitness(pessoasgeradas,1)   
  endif
  chancecross=rand(1);
        if(chancecross<=taxacrossover)
           crossover;
           fitness;            
  endif
until((pessoasgeradas>=populacaototal*numindividuos));
