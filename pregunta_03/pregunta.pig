ejercicio = LOAD 'data.tsv' USING PigStorage('\t')
    AS (
            letra:chararray,
            fecha:chararray,
            numer:int
    );

numeros = FOREACH ejercicio GENERATE numer;
data_ordenada = ORDER numeros By numer asc;
data_ordenada = LIMIT data_ordenada 5;
STORE data_ordenada INTO 'output' USING PigStorage(',');
