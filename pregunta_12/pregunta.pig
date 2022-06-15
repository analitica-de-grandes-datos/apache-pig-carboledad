ejercicio = LOAD 'data.csv' USING PigStorage(',')
    AS (
            id: int,
            nombre:chararray,
            apellido:chararray,
            fecha:chararray,
            color:chararray,
            numer:chararray
    );

sub_conjunto= FOREACH ejercicio GENERATE apellido;
filtro_d_k= FILTER sub_conjunto BY (apellido MATCHES '.*^[d-kD-K].*'); 
STORE filtro_d_k INTO 'output' USING PigStorage(',');
