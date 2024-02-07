SELECT COUNT(*) AS [Count]
FROM Countries
WHERE CountryCode NOT IN (SELECT DISTINCT CountryCode FROM MountainsCountries);