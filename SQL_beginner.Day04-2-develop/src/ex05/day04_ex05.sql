CREATE VIEW  v_price_with_discount AS (
    SELECT name, pizza_name, price, (price * 0.9)::integer AS discount_price
    FROM person_order
    JOIN person ON person_id = person.id
    JOIN menu ON menu.id = menu_id
    ORDER BY name, pizza_name
                                      )
