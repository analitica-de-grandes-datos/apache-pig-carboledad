ejercicio = LOAD 'data.csv' USING PigStorage(',')
    AS (
            id: int,
            nombre:chararray,
            apellido:chararray,
            fecha:chararray,
            color:chararray,
            numer:chararray
    );

sub_conjunto= FOREACH ejercicio GENERATE apellido , UPPER(apellido) AS mayuscula, LOWER(apellido) AS minuscula;
data_ordenada= ORDER sub_conjunto BY apellido, mayuscula, minuscula asc; 
STORE data_ordenada INTO 'output' USING PigStorage(',');
