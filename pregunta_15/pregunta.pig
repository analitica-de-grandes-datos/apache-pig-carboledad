ejercicio = LOAD 'data.csv' USING PigStorage(',')
    AS (
            id: int,
            nombre:chararray,
            apellido:chararray,
            fecha:chararray,
            color:chararray,
            numer:chararray
    );

sub_conjunto= FOREACH ejercicio GENERATE nombre, color;
filtro_B= FILTER sub_conjunto BY (nombre MATCHES '.*^[zZ].*') AND (color == 'blue'); 
STORE filtro_B INTO 'output' USING PigStorage(' ');
