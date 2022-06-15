ejercicio = LOAD 'data.tsv' USING PigStorage('\t')
    AS (
            letra:chararray,
            fecha:chararray,
            numer:int
    );

data_ordenada = ORDER ejercicio BY letra, numer asc;
STORE data_ordenada INTO 'output' USING PigStorage(',');
