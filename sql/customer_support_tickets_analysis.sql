-- =====================================================
-- Customer Support Tickets Analysis
-- PostgreSQL
-- =====================================================


-- =====================================================
-- Table Creation
-- =====================================================
-- Create the table used to store the customer support
-- ticket dataset.

CREATE TABLE customer_support_tickets (
    ticket_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_age INT,
    customer_gender VARCHAR(20),
    product_purchased VARCHAR(100),
    date_of_purchase DATE,
    ticket_type VARCHAR(50),
    ticket_subject VARCHAR(100),
    ticket_description TEXT,
    ticket_status VARCHAR(50),
    resolution TEXT,
    ticket_priority VARCHAR(20),
    ticket_channel VARCHAR(50),
    first_response_time TIMESTAMP,
    time_to_resolution TIMESTAMP,
    customer_satisfaction_rating FLOAT
);


-- =====================================================
-- Dataset Preview
-- =====================================================
-- Display the first 10 records to get a general
-- understanding of the dataset structure and contents.

SELECT *
FROM customer_support_tickets
LIMIT 10;


-- =====================================================
-- 1. Total Number of Support Tickets
-- =====================================================
-- Count the total number of support tickets
-- available in the dataset.

SELECT COUNT(*) AS total_tickets
FROM customer_support_tickets;


-- =====================================================
-- 2. Most Common Issue Types
-- =====================================================
-- Identify the five most frequently reported
-- customer support issue types.

SELECT ticket_type, COUNT(*) AS total_tickets
FROM customer_support_tickets
GROUP BY ticket_type
ORDER BY total_tickets DESC
LIMIT 5;


-- =====================================================
-- 3. Tickets by Support Channel
-- =====================================================
-- Count how many support tickets were submitted
-- through each available support channel.

SELECT ticket_channel, COUNT(*) AS total_tickets
FROM customer_support_tickets
GROUP BY ticket_channel
ORDER BY ticket_channel DESC;


-- =====================================================
-- 4. Average Resolution Time
-- =====================================================
-- Calculate the average time between the first
-- response and ticket resolution for closed tickets.
--
-- Records with missing resolution timestamps or
-- resolution times occurring before the first response
-- are excluded from the calculation.

SELECT 
    AVG(time_to_resolution - first_response_time) 
        AS average_resolution_time
FROM customer_support_tickets
WHERE ticket_status = 'Closed'
  AND time_to_resolution IS NOT NULL
  AND time_to_resolution >= first_response_time;


-- =====================================================
-- 5. Tickets Resolved on the Same Day
-- =====================================================
-- Count the number of closed tickets where the first
-- response and resolution occurred on the same calendar day.
--
-- Records where the resolution occurred before the first
-- response are excluded.

SELECT COUNT(*) AS resolved_same_day
FROM customer_support_tickets
WHERE ticket_status = 'Closed'
  AND DATE(first_response_time) = DATE(time_to_resolution)
  AND time_to_resolution >= first_response_time;


-- =====================================================
-- 6. Tickets Submitted by Month
-- =====================================================
-- Count the number of tickets submitted each month,
-- using the first response timestamp as the available
-- date field for ticket activity in this dataset.

SELECT 
    TO_CHAR(first_response_time, 'YYYY-MM') AS months,
    COUNT(*) AS total_tickets
FROM customer_support_tickets
WHERE first_response_time IS NOT NULL
GROUP BY 1
ORDER BY months;


-- =====================================================
-- 7. Unresolved Tickets
-- =====================================================
-- Count the total number of tickets that have not
-- reached the "Closed" status.

SELECT COUNT(ticket_status) AS unresolved_tickets
FROM customer_support_tickets
WHERE ticket_status <> 'Closed';


