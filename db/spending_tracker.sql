DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;
DROP TABLE budgetsettings;

CREATE TABLE budgetsettings
(
  id SERIAL primary key,
  budget_limit INT
);

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
  date_stamp DATE,
  merchant_id INT REFERENCES merchants(id) ON DELETE CASCADE,
  tag_id INT REFERENCES tags(id) ON DELETE CASCADE
);
