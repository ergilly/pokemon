DROP TABLE stats;
DROP TABLE pokemon;

CREATE TABLE pokemon(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  types VARCHAR(255),
  height DECIMAL,
  weight DECIMAL
);

CREATE TABLE stats(
  id SERIAL PRIMARY KEY,
  health INT,
  attack INT,
  defense INT,
  sp_attk INT,
  sp_def INT,
  speed INT,
  owner INT REFERENCES pokemon(id)
);

INSERT INTO pokemon (name, types, height, weight) VALUES ('Bulbasaur', 'Grass-Poison', 0.7, 6.9);
INSERT INTO pokemon (name, types, height, weight) VALUES ('Charmander', 'Fire', 0.6, 8.5);
INSERT INTO pokemon (name, types, height, weight) VALUES ('Squirtle', 'Water', 0.5, 9);
INSERT INTO pokemon (name, types, height, weight) VALUES ('Pikachu', 'Electric', 0.4, 6);

INSERT INTO stats (health, attack, defense, sp_attk, sp_def, speed, owner) VALUES (45, 49, 49, 65, 65, 45, 1);
INSERT INTO stats (health, attack, defense, sp_attk, sp_def, speed, owner) VALUES (39, 52, 43, 60, 50, 65, 2);
INSERT INTO stats (health, attack, defense, sp_attk, sp_def, speed, owner) VALUES (44, 48, 65, 50, 64, 43, 3);
INSERT INTO stats (health, attack, defense, sp_attk, sp_def, speed, owner) VALUES (35, 55, 40, 50, 50, 90, 4);
