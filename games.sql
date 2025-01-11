-- Select all rows and columns from the table "games"
SELECT *
FROM GAMES;

-- Select unique values of Series that are not null
SELECT DISTINCT
	"Series"
FROM
	GAMES 
WHERE  "Series"  is not null;

--Count unique values of series that are not null
SELECT
	COUNT(DISTINCT "Series") AS UNIQUE_SERIES_COUNT
FROM
	GAMES
WHERE  "Series"  is not null ;

--worst-selling games
SELECT *
FROM GAMES
WHERE "Sales" = (SELECT MIN("Sales") FROM games);

--top 5 best-selling games
SELECT
	*
FROM
	GAMES
ORDER BY
	"Sales" DESC
LIMIT
	5;

--compare Genre
SELECT
    "Genre",
    COUNT(*) AS NUMBER_OF_GAMES,
    SUM("Sales") AS TOTAL_SALES
FROM
    GAMES
GROUP BY
    "Genre"
ORDER BY
    TOTAL_SALES DESC;

--corelation
SELECT
    corr(Number_of_Games, Total_Sales) AS sales_correlation
FROM (
    SELECT
        "Genre",
        COUNT(*) AS Number_of_Games,
        SUM("Sales") AS Total_Sales
    FROM
        GAMES
    GROUP BY
        "Genre"
) AS genre_sales;

-- best release year
SELECT
	EXTRACT(
		YEAR
		FROM
			"Release"
	) AS RELEASE_YEAR,
	COUNT(*) AS NUMBER_OF_GAMES
FROM
	GAMES
GROUP BY
	RELEASE_YEAR
ORDER BY
	NUMBER_OF_GAMES DESC
LIMIT
	1;

--release year and name
SELECT
	"Name",
	"Release"
FROM
	GAMES
ORDER BY
	"Release";

--developer and number of developing games
SELECT
	"Developer",
	COUNT(*) AS NUMBER_OF_GAMES
FROM
	GAMES
GROUP BY
	"Developer"
ORDER BY
	NUMBER_OF_GAMES DESC;

--publisher and number of publishing games
SELECT
	"Publisher",
	COUNT(*) AS NUMBER_OF_GAMES
FROM
	GAMES
GROUP BY
	"Publisher"
ORDER BY
	NUMBER_OF_GAMES DESC;

--genre and average sales
SELECT
	"Genre",
	AVG("Sales") AS AVERAGE_SALES
FROM
	GAMES
GROUP BY
	"Genre"
ORDER BY
	AVERAGE_SALES DESC;

--best series
SELECT
	"Series",
	SUM("Sales") AS TOTAL_SALES
FROM
	GAMES
WHERE
	"Series" IS NOT NULL
	AND "Series" <> ''
GROUP BY
	"Series"
ORDER BY
	TOTAL_SALES DESC
LIMIT
	1;

--Best-selling RTS game by sales
SELECT
	"Name",
	"Sales",
	"Genre"
FROM
	GAMES
WHERE
	"Genre" = 'Real-time strategy'
ORDER BY
	"Sales" DESC
LIMIT
	1;

--Number of games released per year
SELECT
	EXTRACT(
		YEAR
		FROM
			"Release"
	) AS RELEASE_YEAR,
	COUNT(*) AS NUMBER_OF_GAMES
FROM
	GAMES
GROUP BY
	RELEASE_YEAR
ORDER BY
	RELEASE_YEAR;

--Best-selling games by genre
SELECT
	"Genre",
	"Name",
	"Sales"
FROM
	GAMES
WHERE
	"Sales" = (
		SELECT
			MAX("Sales")
		FROM
			GAMES AS G2
		WHERE
			G2."Genre" = GAMES."Genre"
	)
ORDER BY
	"Sales" DESC;

--Games released by genre and year
SELECT
	EXTRACT(
		YEAR
		FROM
			"Release"
	) AS RELEASE_YEAR,
	"Genre",
	COUNT(*) AS NUMBER_OF_GAMES
FROM
	GAMES
GROUP BY
	RELEASE_YEAR,
	"Genre"
ORDER BY
	RELEASE_YEAR,
	NUMBER_OF_GAMES DESC;

--Total sales by developer and publisher
SELECT
	"Developer",
	"Publisher",
	SUM("Sales") AS TOTAL_SALES
FROM
	GAMES
GROUP BY
	"Developer",
	"Publisher"
ORDER BY
	TOTAL_SALES DESC;

--List of developers with 'Studios' in their name
SELECT DISTINCT
	"Developer"
FROM
	GAMES
WHERE
	"Developer" LIKE '%Studios%';

--Best-selling games in each series
SELECT
	"Series",
	"Name",
	"Sales"
FROM
	GAMES
WHERE
	"Sales" = (
		SELECT
			MAX("Sales")
		FROM
			GAMES AS G2
		WHERE
			G2."Series" = GAMES."Series"
	)
ORDER BY
	"Sales" DESC;
delete from games;
