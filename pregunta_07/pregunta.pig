ejercicio = LOAD 'data.tsv' USING PigStorage('\t')
    AS (
            letra:chararray,
            conjunto:chararray,
            lista:chararray
    );


data = FOREACH ejercicio GENERATE letra, TOKENIZE(conjunto,',') AS conjunto_desagregado, TOKENIZE(lista,',') AS lista_desagregada;
data = FOREACH data GENERATE letra, COUNT(conjunto_desagregado) AS numero_datos_conjunto, COUNT(lista_desagregada) AS numero_datos_lista;
data = ORDER data BY letra, numero_datos_conjunto, numero_datos_lista asc;
STORE data INTO 'output' USING PigStorage(',');
