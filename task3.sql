-- Top 5 Students by Total Score
-- SELECT name,
--        (MathScore + ScienceScore + EnglishScore) AS total_score
-- FROM Students
-- ORDER BY total_score DESC
-- LIMIT 5;


-- SELECT AVG(MathScore) AS average_math_score
-- FROM Students
-- WHERE MathScore > 70;

-- SELECT AVG(total) AS avg_total_score
-- FROM (
--     SELECT (MathScore + ScienceScore + EnglishScore) AS total
--     FROM Students
-- ) AS totals
-- WHERE total BETWEEN 200 AND 250;

-- SELECT MAX(MathScore ) AS second_highest_math_score
-- FROM Students
-- WHERE MathScore  < (SELECT MAX(MathScore ) FROM Students);





