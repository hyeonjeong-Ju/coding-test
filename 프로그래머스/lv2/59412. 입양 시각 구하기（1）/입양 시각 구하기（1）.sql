/* 에러났던 쿼리
SELECT HOUR(DATETIME), COUNT(DATETIME)
FROM ANIMAL_OUTS 
GROUP BY HOUR(DATETIME)
HAVING HOUR(DATETIME) BETWEEN 9 AND 19
ORDER BY HOUR(DATETIME)
*/

-- HAVING HOUR(DATETIME)을 거니까 SELECT HOUR(DATETIME)시 에러가 발생했다.
-- HAVING 이후 조건을 거는 column은 추가적인 COMMAND가 가미되지 않은 아닌 순수한 column명을 그대로 써줘야한다.
-- https://medium.com/learn-from-data/having%EC%9D%98-%EB%B9%84%EB%B0%80-7ebf56834436

-- 제출 쿼리 (에러났던 쿼리를 돌아가게 하려고 SUBQUERY를 사용함)
SELECT HOUR(DATETIME), COUNT(DATETIME)
FROM (SELECT DATETIME 
      FROM ANIMAL_OUTS 
      WHERE HOUR(DATETIME)
      BETWEEN 9 AND 19) A
GROUP BY HOUR(DATETIME)
ORDER BY HOUR(DATETIME)

-- 링크 자료를 참고로 가능한 쿼리
SELECT HOUR(DATETIME) HOUR, COUNT(DATETIME)
FROM ANIMAL_OUTS 
GROUP BY 1
HAVING HOUR BETWEEN 9 AND 19
ORDER BY 1

-- MYSQL date and time document link
-- https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_hour
