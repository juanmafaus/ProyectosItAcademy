-- -------------------------------NIVEL 1------------------------------------------------------------ 

-- ejercicio 2 
SELECT company_name AS nombreEmpresa, email, country AS país
FROM company
ORDER BY nombreEmpresa;
-- ejercicio 3 
SELECT DISTINCT country AS paises
FROM company
JOIN transaction
ON company.id = company_id
WHERE amount > 0 AND declined = 0;
-- ejercicio 4 
SELECT count(distinct country) AS cantidadPaíses
FROM company
JOIN transaction
ON company.id = company_id
WHERE amount > 0 AND declined = 0;
-- ejercicio 5 
SELECT country AS país, company_name AS nombreCompañia
FROM company
WHERE id = 'b-2354';
-- ejercicio 6 
SELECT company_name AS nombreCompañia, AVG(amount) AS despesaMitjana
FROM company
JOIN transaction
ON company.id = company_id
WHERE declined = 0
GROUP BY nombreCompañia
ORDER BY despesaMitjana DESC
LIMIT 1;

-- ------------------------------------------- NIVEL 2--------------------------------------------------
-- Ejercicio 1 
-- comprobación de company.id
SELECT company.id, COUNT(*) AS cantidad
FROM company
GROUP BY company.id
HAVING cantidad > 1;
-- comprobación de company_name
SELECT company_name AS nombreCompañia, COUNT(*) AS cantidad
FROM company
GROUP BY company_name 
HAVING cantidad > 1;
-- comprobación de email
SELECT email, COUNT(*) AS cantidad
FROM company
GROUP BY email
HAVING cantidad > 1;
-- comprobacion de phone
SELECT phone, COUNT(*) AS cantidad
FROM company
GROUP BY phone
HAVING cantidad > 1;
-- comprobacion de website
SELECT website, COUNT(*) AS cantidad
FROM company
GROUP BY website
HAVING cantidad > 1
ORDER BY cantidad DESC;
-- comprobacion de country
SELECT country, COUNT(*) AS cantidad
FROM company
GROUP BY country
HAVING cantidad > 1
ORDER BY cantidad DESC;

-- Ejercicio 2 
SELECT sum(amount) AS monto, DATE(timestamp) AS fecha
FROM transaction
WHERE declined = 0
GROUP BY fecha
ORDER BY monto DESC
LIMIT 5;

-- Ejercicio 3

SELECT sum(amount) AS monto, DATE(timestamp) AS fecha
FROM transaction
WHERE declined = 0
GROUP BY fecha
ORDER BY monto ASC
LIMIT 5;


-- Ejercicio 4
SELECT country AS país, AVG(amount) AS despesaMitjana
FROM company
JOIN transaction 
ON company.id = company_id
WHERE declined = 0
GROUP BY country
ORDER BY despesaMitjana DESC;

-- --------------------------------------------- NIVEL 3------------------------------------------------
-- Ejercicio 1

SELECT company_name, phone, country, SUM(amount) AS totalGastado
FROM company
JOIN transaction
ON company.id = company_id
WHERE declined = 0 AND amount BETWEEN 100 AND 200
GROUP BY company_name, phone, country
ORDER BY totalGastado DESC;

-- Ejercicio 2
SELECT DISTINCT company_name
FROM company
JOIN transaction
ON company.id = company_id
WHERE declined = 0 AND DATE(timestamp) IN ("2022-03-16", "2022-02-28","2022-02-13");
