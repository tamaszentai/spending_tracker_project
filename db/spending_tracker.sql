DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;

CREATE TABLE tags
(
  id SERIAL primary key,
  name VARCHAR(255) not null
);

CREATE TABLE merchants
(
  id SERIAL primary key,
  name VARCHAR(255) not null
);

CREATE TABLE transactions
(
  id SERIAL primary key,
  amount INT,
  time_stamp TIMESTAMP,
  merchant_id INT REFERENCES merchants(id),
  tag_id INT REFERENCES tags(id)
);
