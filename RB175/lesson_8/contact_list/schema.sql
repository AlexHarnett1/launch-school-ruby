CREATE TABLE contacts(
  id serial PRIMARY KEY,
  name text NOT NULL,
  email text NOT NULL,
  phone_number text NOT NULL,
  date_added date NOT NULL DEFAULT NOW()
);