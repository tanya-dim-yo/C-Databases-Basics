SELECT
	p.PeakName, r.RiverName, LOWER(LEFT(p.PeakName, LEN(p.PeakName) - 1) + r.RiverName) AS Mix
FROM
	Peaks AS p
JOIN
	Rivers AS r
ON
	LOWER(RIGHT(p.PeakName, 1)) = LOWER(LEFT(r.RiverName, 1))
ORDER BY
	Mix;