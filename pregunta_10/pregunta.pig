ejercicio = LOAD 'data.csv' USING PigStorage(',')
    AS (
            id: int,
            nombre:chararray,
            apellido:chararray,
            fecha:chararray,
            color:chararray,
            numer:chararray
    );

sub_conjunto= FOREACH ejercicio GENERATE apellido , SIZE(apellido) AS longitud;
data_ordenada= ORDER sub_conjunto BY longitud desc, apellido asc; 
data_ordenada= LIMIT data_ordenada 5;
STORE data_ordenada INTO 'output' USING PigStorage(',');
