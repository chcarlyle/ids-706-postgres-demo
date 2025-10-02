#Example 1
SELECT name, cuisine, avg_cost
FROM restaurants
ORDER BY avg_cost ASC
LIMIT 5;
#Example 2
SELECT name, cuisine, distance_miles, rating
FROM restaurants
WHERE distance_miles <= 5 AND rating >= 4.0
ORDER BY rating DESC, distance_miles ASC;

#My Queries
#Restaurants within 2 miles
SELECT name, distance_miles
FROM restaurants
WHERE distance_miles < 2
ORDER BY distance_miles ASC;

#Top 3 highest rated restaurants
SELECT name, rating
FROM restaurants
ORDER BY rating DESC
LIMIT 3;

#Restaurants by average cost with 7.5% tax
SELECT name, avg_cost, ROUND(avg_cost * 1.075, 2) AS cost_with_tax
FROM restaurants
ORDER BY name;

#Counts of each cuisine type
SELECT
    INITCAP(LOWER(COALESCE(NULLIF(TRIM(cuisine), ''), 'unknown'))) AS cuisine,
    COUNT(*) AS restaurant_count
FROM restaurants
GROUP BY
    LOWER(COALESCE(NULLIF(TRIM(cuisine), ''), 'unknown'))
ORDER BY restaurant_count DESC;