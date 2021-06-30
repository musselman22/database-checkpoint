DROP TABLE IF EXISTS destinations;

CREATE TABLE destinations(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  average_temp INT,
  has_beaches BOOLEAN,
  has_mountains BOOLEAN,
  cost_of_flight INT
);

INSERT INTO destinations(name, average_temp, cost_of_flight, has_beaches, has_mountains) 
VALUES 
  ('Thailand', 82, 765, true, true),
  ('Minnesota', 41, 235, false, false),
  ('New Zealand', 66, 433, true, true),
  ('England', 45, 290, false, false),
  ('Tristan da Cunha', 59, 1304, true, true);


DROP TABLE IF EXISTS airlines;

CREATE TABLE airlines(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

INSERT INTO airlines(name)
VALUES
  ('Spirit'),
  ('Lufthansa'),
  ('Delta'),
  ('Southwest');

CREATE TABLE airlines_destinations(
    airline_id int NOT NULL,
    destination_id int NOT NULL,
    CONSTRAINT pk_airline_destination PRIMARY KEY (airline_id, destination_id),
    CONSTRAINT fk_airline_id FOREIGN KEY (airline_id ) REFERENCES airlines (id) ON DELETE SET NULL,
    CONSTRAINT fk_destination_id FOREIGN KEY (destination_id) REFERENCES destinations (id) ON DELETE SET NULL
);

INSERT INTO airlines_destinations(airline_id, destination_id)
VALUES
  (1, 3),
  (1, 4),
  (2, 5),
  (2, 4),
  (2, 1),
  (3, 1),
  (3, 4),
  (4, 3),
  (4, 5);
