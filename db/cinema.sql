DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255),
  funds INT2
);

CREATE TABLE films (
  id SERIAL2 PRIMARY KEY,
  title VARCHAR(255)
);

CREATE TABLE tickets (
  id SERIAL2 PRIMARY KEY,
  customer_id INT2 REFERENCES customers(id),
  screening_id INT2 REFERENCES screenings(id)
);
