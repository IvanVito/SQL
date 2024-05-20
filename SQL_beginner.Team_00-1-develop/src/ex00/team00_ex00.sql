CREATE TABLE  points (
    id INTEGER PRIMARY KEY,
    point1 VARCHAR(1),
    point2 VARCHAR(1),
    cost INTEGER
);

INSERT INTO points (id, point1, point2, cost)
VALUES
        (1, 'a', 'b', 10),
        (2, 'b', 'a', 10),
        (3, 'a', 'd', 20),
        (4, 'd', 'a', 20),
        (5, 'a', 'c', 15),
        (6, 'c', 'a', 15),
        (7, 'b', 'd', 25),
        (8, 'd', 'b', 25),
        (9, 'd', 'c', 30),
        (10, 'c', 'd', 30),
        (11, 'b', 'c', 35),
        (12, 'c', 'b', 35);

CREATE VIEW pre_tour AS (
    WITH RECURSIVE paths AS (
      SELECT point1, point2, cost, ARRAY[point1, point2] ::varchar[] AS tour, cost AS total_cost
      FROM points
      WHERE point1 = 'a'
      UNION
      SELECT po.point1, po.point2, po.cost, paths.tour || po.point2, paths.total_cost + po.cost
      FROM points po
      JOIN paths  ON po.point1 = paths.point2
      WHERE NOT po.point2 = ANY(paths.tour))
    
    SELECT tour, total_cost
    FROM paths
    WHERE (array_length(tour, 1) = 4)
    ORDER BY total_cost, tour);

CREATE VIEW done_tour AS(
    SELECT pre_tour.total_cost + points.cost AS total_cost, pre_tour.tour || points.point2 AS tour
    FROM pre_tour
    JOIN points ON pre_tour.tour[4] = points.point1 AND point2 = 'a');

CREATE VIEW ex00 AS (
    SELECT *
    FROM done_tour
    WHERE total_cost = (SELECT MIN(total_cost) FROM done_tour)
    ORDER BY total_cost, tour);
