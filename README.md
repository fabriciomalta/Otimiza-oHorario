# Otimiza-oHorario
Olá,

Este projeto é referente a um Algoritmo Genético de resolução de problema de grade horária.

Para executar o arquivo basta que o script algoritmo genetico seja rodado em OCTAVE, os parâmetros podem ser definidos no topo do arquivo.
Os detalhes da codificação para o problema, pode ser encontrado em:
http://ocs.ifsp.edu.br/index.php/conict/xconict/paper/view/5286

O algoritmo utiliza o método de seleção por roleta com elitismo.
O critério de parada é a quantidade de índividuos selecionado.
A mutação é a troca aleatória de um dia pelo outro, ou seja, a troca de um subconjunto de três colunas com duas linhas.
A recombinação é a seleção dos pais e realiza-se o sorteio de uma turma e é realizado sua troca. Um filho herda todas turmas do pais e uma turma da mãe, o outro, o inverso.

É disponibilizado uma tela visual para visualização do comportamento do algoritmo.
Quando o Algoritmo obtém uma solução minimamente factível, ou seja, não teve pontuação grave (bastando que a solução tenha função objetivo < 10.000) o algoritmo emite uma informação.

Qualquer dúvida, enviar email para: fabricio.malta@ifsp.edu.br

Obrigado!


               


