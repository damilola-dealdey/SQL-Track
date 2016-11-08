CREATE TABLE Email (
  'Email' varchar(50) NOT NULL,
  'Phone' varchar(50) NOT NULL,
  'City' varchar(50) NOT NULL
)

> mysqlimport --local --fields-terminated-by=":" --lines-terminated-by="\r" \ samples Email.txt