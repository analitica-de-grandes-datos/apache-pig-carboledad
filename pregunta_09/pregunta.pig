ejercicio = LOAD 'data.csv' USING PigStorage(',')
    AS (
            id: int,
            nombre:chararray,
            apellido:chararray,
            fecha:chararray,
            color:chararray,
            numer:chararray
    );
sub_conjunto= FOREACH ejercicio GENERATE CONCAT(nombre,'@',apellido);
 
STORE sub_conjunto INTO 'output' USING PigStorage(',');
