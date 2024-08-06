DROP TABLE IF EXISTS public.expenses;

CREATE TABLE expenses(
  id SERIAL PRIMARY KEY,
  amount NUMERIC(6, 2) NOT NULL CHECK (amount > 0),
  memo varchar(50) NOT NULL,
  created_on DATE NOT NULL
);

INSERT INTO expenses (amount, memo, created_on) VALUES
(13.42, 'Tacos', NOW()),
(4.25, 'Horchata', NOW()),
(5.30, 'Chips and Guac', NOW());