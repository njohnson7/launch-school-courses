--------------------------------- ASSIGNMENT 6 -------------------------------

----------- 1 --------------

-- 9999.99 is the largest value that can be stored in the amount column

INSERT INTO expenses VALUES (1, 9999.99, 'largest value');
-- INSERT 0 1

INSERT INTO expenses VALUES (1, 10000, 'too big');
-- numeric field overflow
-- DETAIL:  A field with precision 6, scale 2 must round to an absolute value less than 10^4







----------- 2 --------------

-- -9999.99






----------- 3 --------------

ALTER TABLE expenses ADD CONSTRAINT positive_amount CHECK (amount >= 0.01);

















--------------------------------- ASSIGNMENT 8 -------------------------------

------- 1 --------

  -- We call puts and pass it an argument of a string created by defining a HEREDOC called HELP, which contains all the text to be displayed in the help message




--------------------------------- ASSIGNMENT 9 -------------------------------

------- 1 --------

  -- potential issues:
    -- command argument is case sensitive
    -- no validation for what type of arguments are accepted
      -- this could be a security issue if malicious code was entered as arg
      -- also this could cause databse inconsistencies
    -- DB is connected to even if not needed for every situation
    -- only 2 args are accepted, so date cannot be changed

    -- memo cannot have apostrophes in it


--------------------------------- ASSIGNMENT 10 -------------------------------

------- 1 --------

-- connection.exec_params('SELECT $1::integer + $2', [3]).values
-- PG::ProtocolViolation: ERROR:  bind message supplies 1 parameters, but prepared statement "" requires 2



------ 2 --------

-- sql = "INSERT INTO expenses (amount, memo, created_on) VALUES ($1, $2, $3);"
-- CONNECTION.exec_params(sql, [amount, memo, date])


----- 3 ------

-- now it gets added to the database normally, and the code is not executed
-- single quotes can also be added now