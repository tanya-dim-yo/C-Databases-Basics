SELECT
	[mc].[CountryCode],
	COUNT(*) AS [MountainRanges]
FROM [MountainsCountries] [mc]
WHERE [mc].[CountryCode] IN ('US', 'RU', 'BG')
GROUP BY [mc].[CountryCode]