ejercicio = LOAD 'data.csv' USING PigStorage(',')
    AS (
            id: int,
            nombre:chararray,
            apellido:chararray,
            fecha:chararray,
            color:chararray,
            numer:chararray
    );

sub_conjunto= FOREACH ejercicio GENERATE color;
filtro_B= FILTER sub_conjunto BY (color MATCHES '.*^[bB].*'); 
STORE filtro_B INTO 'output' USING PigStorage(',');
