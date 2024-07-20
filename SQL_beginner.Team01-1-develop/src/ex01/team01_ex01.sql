CREATE OR REPLACE FUNCTION fnc_t1 (
    pcurid INTEGER,
    pdate timestamp)
RETURNS TABLE (id BIGINT, name VARCHAR, rate_to_usd NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT c.id, c.name, c.rate_to_usd
    FROM currency c
    WHERE c.id = pcurid AND c.updated < pdate
    ORDER BY updated DESC
    LIMIT 1;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fnc_t2 (
    pcurid INTEGER,
    pdate timestamp)
RETURNS TABLE (id BIGINT, name VARCHAR, rate_to_usd NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT c.id, c.name, c.rate_to_usd
    FROM currency c
    WHERE c.id = pcurid AND c.updated > pdate
    ORDER BY updated
    LIMIT 1;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fnc_dis(
    pppcurid INTEGER,
    pppdate timestamp)
RETURNS TABLE (id BIGINT, name VARCHAR, rate_to_usd NUMERIC) AS $$
DECLARE
    row_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO row_count
    FROM fnc_t1(pcurid := pppcurid, pdate := pppdate);
    IF row_count > 0 THEN
        RETURN QUERY SELECT fnc_t1.id, fnc_t1.name, fnc_t1.rate_to_usd FROM fnc_t1(pcurid := pppcurid, pdate := pppdate);
    ELSE
        RETURN QUERY SELECT fnc_t2.id, fnc_t2.name, fnc_t2.rate_to_usd FROM fnc_t2(pcurid := pppcurid, pdate := pppdate);
    END IF;
END;
$$ LANGUAGE plpgsql;



SELECT COALESCE(u.name, 'not defined') AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       fnc_dis.name AS currency_name,
       b.money * (SELECT fnc_dis.rate_to_usd
                    FROM fnc_dis(pppcurid := b.currency_id, pppdate := b.updated)) AS currency_in_usd
FROM balance b
FULL JOIN "user" u ON u.id = b.user_id
JOIN fnc_dis(pppcurid := b.currency_id, pppdate := b.updated) ON b.currency_id = fnc_dis.id
ORDER BY name DESC, lastname, currency_name;





