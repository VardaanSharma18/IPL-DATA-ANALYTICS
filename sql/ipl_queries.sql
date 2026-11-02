-- TOP 10 MOST SUCCESFULL TEAMS IN IPL

SELECT winner AS Teams, 
    COUNT(*) AS Total_Wins
FROM matches
WHERE winner IS NOT NULL
GROUP BY Teams
ORDER BY Total_Wins DESC
LIMIT 10;

-- ******************************

-- TOP 10 BATSMEN BASED ON TOTAL RUNS SCORED?

SELECT batter AS batsmen, 
       SUM(batsman_runs) AS total_runs
FROM deliveries
GROUP BY batsmen
ORDER BY total_runs DESC
LIMIT 10;

-- ******************************

-- TOP 10 BOWLERS BASED ON NUMBER OF WICKETS?

SELECT bowler,
       SUM(is_wicket) AS total_wickets
FROM deliveries
WHERE is_wicket = 1 AND
      dismissal_kind NOT IN ('retired hurt',
                            'retired out',
                            'run out',
                            'obstructing the field')
GROUP BY bowler
ORDER BY total_wickets DESC
LIMIT 10;

-- ******************************

-- WHICH TEAMS WIN MOST WHEN CHASING?

SELECT winner AS teams,
       COUNT(*) AS chase_wins
FROM matches
WHERE toss_decision = 'field' AND
      toss_winner = winner
GROUP BY teams
ORDER BY chase_wins DESC
LIMIT 10;

-- ******************************

-- TOP PERFORMERS ACCORDING TO THE SCORING MODEL

SELECT batter AS batsman,
       total_runs,
       strike_rate,
       innings_played,
       performance_score
FROM batting_stats
ORDER BY performance_score DESC
LIMIT 10;