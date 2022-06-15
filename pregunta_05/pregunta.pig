ejercicio = LOAD 'data.tsv' USING PigStorage('\t')
    AS (
            letra:chararray,
            conjunto:chararray,
            lista:int
    );

columna_2 = FOREACH ejercicio GENERATE conjunto;
columna_2_desagregada = FOREACH columna_2 GENERATE FLATTEN(TOKENIZE(conjunto)) AS letra;
columna_2_desagregada = FILTER columna_2_desagregada BY (letra MATCHES '.*[a-z].*');
agrupacion_letras = GROUP columna_2_desagregada BY letra;
wordcount = FOREACH agrupacion_letras GENERATE group, COUNT(columna_2_desagregada);
STORE wordcount INTO 'output' USING PigStorage(',');
