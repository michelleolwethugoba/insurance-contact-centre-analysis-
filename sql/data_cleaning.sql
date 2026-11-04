-- check call status values

SELECT DISTINCT call_status
FROM insurance_calls;

-- count each status

SELECT 
    call_status
    COUNT(*)
FROM insurance_calls
GROUP BY call_status
ORDER BY COUNT(*) DESC;


-- Standardize call status values

UPDATE insurance_calls
SET call_status = 'Answered'
WHERE call_status = 'Answerd';

UPDATE insurance_calls
SET call_status = 'Missed'
WHERE call_status = 'Missd';

-- Finding missing agent names

SELECT * 
FROM insurance_calls
WHERE agent_name IS NULL
    OR agent_name = '';

-- update agent_name: fill in missing agent names in the insurance_calls table by looking up the correct name from the agents table.
UPDATE insurance_calls ic
SET agent_name = a.agent_name
FROM agents a
WHERE ic.agent_id = a.agent_id
AND (
    ic.agent_name IS NULL
    OR ic.agent_name = ''
);

-- Finding duplicate calls
SELECT call_id,
COUNT(*)
FROM insurance_calls
GROUP BY call_id
HAVING COUNT(*) > 1;


