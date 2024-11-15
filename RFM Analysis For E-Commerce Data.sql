--Recency

WITH recency as
(
SELECT DISTINCT customer_id,
MAX(invoicedate::date) OVER()-MAX(invoicedate::date) OVER(PARTITION BY customer_id) as recency
FROM rfm
WHERE customer_id is not null
),


--Frequency

frequency as
(
SELECT customer_id,
COUNT(DISTINCT invoiceno) as frequency
FROM rfm 
WHERE customer_id is not null
GROUP BY 1
),


--Monetary

monetary as
(
SELECT customer_id,
round(SUM(quantity*unitprice)) as monetary
FROM rfm 
WHERE customer_id is not null
GROUP BY 1
),
--Scores
scores as
(
SELECT r.customer_id, 
recency, 
NTILE(5) OVER(ORDER BY recency desc) as r_score,
frequency, 
CASE  WHEN frequency between 0 and 9 THEN 1
            WHEN frequency between 10 and 19 THEN 2
            WHEN frequency between 20 and 29 THEN 3
            WHEN frequency between 30 and 39 THEN 4
            ELSE 5 END as f_score,
monetary,
NTILE(5) OVER(ORDER BY monetary) as m_score
FROM recency as r
JOIN frequency as f
ON r.customer_id=f.customer_id
JOIN monetary as m
ON r.customer_id=m.customer_id
)

--Score

SELECT customer_id,
r_score||'-'||f_score||'-'||m_score as rfm_score
FROM scores
ORDER BY 2 DESC
