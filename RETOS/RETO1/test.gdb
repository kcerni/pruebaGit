# con esta sentencia se indica el archivo de salida 
# para poder ver los resultados
set logging file output.txt
# para que las salidas de print se vean bien
set print pretty on

# para que las salidas de los comandos se registren
set logging on

# para evitar que gdb haga preguntas y\n
set pagination off

file numeroFuerte
b _start
b Fin 
r
c
ni 3
i r r8
i r r9
q