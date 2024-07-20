CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
RETURNS TABLE(fib integer) AS $$
DECLARE
   a integer := 0;
   b integer := 1;
   temp integer := 0;
BEGIN
   RETURN QUERY SELECT a;
   WHILE b < pstop LOOP
      RETURN QUERY SELECT b;
      temp := a;
      a := b;
      b := temp + b;
   END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_fibonacci(100);

SELECT * FROM fnc_fibonacci();