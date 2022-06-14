ejercicio = LOAD 'data.tsv' USING PigStorage('\t')
    AS (
            letra:chararray,
            conjunto:chararray,
            lista:chararray
    );

columna_2 = FOREACH ejercicio GENERATE lista;
columna_2_desagregada = FOREACH columna_2 GENERATE FLATTEN(TOKENIZE(lista)) AS clave;
columna_2_desagregada = FOREACH columna_2_desagregada GENERATE REPLACE (clave,'([^a-zA-Z\\s]+)','') as clave;
agrupacion_letras = GROUP columna_2_desagregada BY clave;
wordcount = FOREACH agrupacion_letras GENERATE group, COUNT(columna_2_desagregada);
STORE wordcount INTO 'output' USING PigStorage(',');
