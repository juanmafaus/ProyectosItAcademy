-- -------------------------------------- NIVEL 1 --------------------------------------------------------
-- Ejercicio 1
SELECT *
FROM transaction 
WHERE company_id IN (SELECT id
FROM company
WHERE country = 'Germany');

-- Ejercicio 2
SELECT DISTINCT company_name
FROM company
JOIN transaction
ON company_id = company.id
WHERE  amount > (SELECT avg(amount)
FROM transaction);

-- Ejercicio 3
SELECT company.company_name, transaction.*
FROM transaction
JOIN company
ON company_id = company.id
WHERE company_name like 'c%';

-- Ejercicio 4
SELECT *
FROM company
JOIN transaction
ON company.id = company_id
WHERE company.id NOT IN (transaction.company_id);




-- ------------------------------- NIVEL 2-------------------------------------------------------------
-- Ejercicio 1

SELECT company_name AS nombreCompañia, transaction.*
FROM transaction
JOIN company
ON company.id = company_id
WHERE country = (SELECT country
FROM company
WHERE company_name LIKE '%Non Inst%')
ORDER BY nombreCompañia DESC;

-- Ejercicio 2
SELECT company_name AS nombreCompañia, amount AS monto
FROM company
JOIN transaction
ON company.id = company_id
WHERE amount = (SELECT MAX(amount)
FROM transaction);



-- --------------------------------------NIVEL 3-------------------------------------------------------
-- Ejercicio 1 
SELECT country AS país, avg(amount) AS mediaPorPaís
FROM company
JOIN transaction
ON company.id = company_id
GROUP BY país
HAVING mediaPorPaís > (SELECT avg(amount)
FROM transaction)
ORDER BY mediaPorPaís DESC;

-- Ejercicio 2
-- opcion case

SELECT company_name AS nombreCompañia, 
       
       CASE 
           WHEN COUNT(transaction.id) > 4 THEN 'Más de 4 transacciones'
           ELSE 'Menor o igual que 4 transacciones'
       END AS mayorMenor
FROM company
JOIN transaction
ON company.id = transaction.company_id
GROUP BY nombreCompañia
ORDER BY mayorMenor, nombreCompañia;


-- opcion if

SELECT company_name AS NombreCompañia, 
IF(COUNT(transaction.id) > 4,"Más de 4 transacciones","Menor o igual que 4 transacciones") AS mayorMenor
FROM company
JOIN transaction 
ON company.id = transaction.company_id
GROUP BY company_name
ORDER BY mayorMenor, NombreCompañia;











