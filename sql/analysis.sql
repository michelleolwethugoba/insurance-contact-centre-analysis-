-- Total calls by status

SELECT 
    call_status,
    COUNT(*) AS total_calls
FROM insurance_calls
GROUP BY call_status
ORDER BY total_calls DESC;

-- Calls by queue
SELECT
    queue_name,
    COUNT(*) AS total_calls 
FROM insurance_calls
GROUP BY queue_name
ORDER BY total_calls DESC;

-- Abandoned Calls by Queue

SELECT
    queue_name,
    COUNT(*) AS abandoned_calls
FROM insurance_calls
WHERE call_status = 'Abandoned'
GROUP BY queue_name;

-- Missed calls by queue
SELECT
    queue_name,
    COUNT(*) AS missed_calls
FROM insurance_calls
WHERE call_status = 'Missed'    
GROUP BY queue_name
ORDER BY missed_calls DESC;

-- Agents with Most Missed Calls

SELECT
    agent_name,
    COUNT(*) AS missed_calls
FROM insurance_calls
WHERE call_status = 'Missed'
GROUP BY agent_name
ORDER BY missed_calls DESC;