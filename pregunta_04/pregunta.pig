ejercicio = LOAD 'data.csv' USING PigStorage(',')
    AS (
            driverId:int,
            truckId:int,
            eventTime:chararray,
            eventType:chararray,
            longitude:double,
            latitude:double,
            eventKey:chararray,
            correlationId:chararray,
            driverName:chararray,
            routeId:biginteger,
            routeName:chararray,
            eventDate:chararray
    );
primer_10_regist= LIMIT ejercicio 10;
primer_3_columns = FOREACH primer_10_regist GENERATE driverId, truckId, eventTime;
data_ordenada = ORDER primer_3_columns By driverId, truckId, eventTime asc;
STORE data_ordenada INTO 'output' USING PigStorage(',');
