ejercicio = LOAD 'data.tsv' USING PigStorage('\t')
    AS (
            letra:chararray,
            conjunto:chararray,
            lista:chararray
    );

datos= FOREACH ejercicio GENERATE FLATTEN(TOKENIZE(conjunto, ',')) AS conjunto_desagregado, FLATTEN(TOKENIZE(lista, ',')) AS lista_desagregada;
datos = FOREACH datos GENERATE REPLACE(conjunto_desagregado, '([^a-zA-Z\\s]+)','') AS letra, REPLACE(lista_desagregada,'([^a-zA-Z\\s]+)','') AS clave;
datos = FOREACH datos GENERATE TOTUPLE(letra,clave) as tupla; 
agrupacion = GROUP datos BY tupla;
contador = FOREACH agrupacion GENERATE group, COUNT(datos); 
STORE contador INTO 'output' USING PigStorage(',');
