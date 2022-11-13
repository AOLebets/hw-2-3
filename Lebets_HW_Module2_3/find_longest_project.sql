SELECT P.ID, P.START_DATE, P.FINISH_DATE, DATEDIFF( 'MONTH', P.START_DATE, P.FINISH_DATE )
FROM   PROJECT P
ORDER BY 4 DESC; 

SELECT P.ID
      ,DATEDIFF( 'MONTH', P.START_DATE, P.FINISH_DATE ) AS MONTH_COUNT
FROM   PROJECT P
GROUP BY P.ID 
HAVING MONTH_COUNT = ( SELECT MAX( F.MONTH_COUNT )
                       FROM ( SELECT P.ID
                                    ,DATEDIFF( 'MONTH', P.START_DATE, P.FINISH_DATE ) AS MONTH_COUNT
                              FROM   PROJECT P ) F
                              );