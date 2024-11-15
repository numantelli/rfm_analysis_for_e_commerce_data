# rfm_analysis_for_e_commerce_data
Here is a RFM analysis for E-Commerce Data which is from kaggle.com

RFM, also known as RFM analysis, is a type of customer segmentation and behavioral targeting used to help businesses rank and segment customers based on the recency, frequency, and monetary value of a transaction. RFM marketing can help marketers and small business owners determine their target audience to use their budget most effectively.

Recency – How recently did the customer purchase?
Frequency – How often do they purchase?
Monetary Value – How much do they spend?

We have customer_id, invoicedate, invoiceno, quantity and unitprice data in our table

RECENCY,
What is the difference between last booking date and today for each customer. 
But today is not real today. We accept that today is last day of our data.
 

FREQUENCY,
How many invoiceno do each customer have until today. 


MONETARY,
How much total payment do each customer have until today. 

SCORES, 
Now we can give scores by splitting of values for each customer.  From low (1) to high (5) score. 
recency   --> from 1 to 5 / from longest difference to shortest difference 
frequency --> from 1 to 5 / from more amount to less amount
monetary  --> from 1 to 5 / from more payment to less payment

At the end of anaysis, we can see overall results on single table. 
