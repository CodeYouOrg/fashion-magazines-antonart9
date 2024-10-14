SELECT customers.customer_name AS 'Customer', PRINTF('$%.2f',SUM(subscriptions.price_per_month*subscriptions.subscription_length)) AS 'Amount Due'
FROM subscriptions
INNER JOIN orders ON subscriptions.subscription_id=orders.subscription_id
INNER JOIN customers ON orders.customer_id=customers.customer_id
WHERE order_status='unpaid'
GROUP BY customer_name
ORDER BY SUM(subscriptions.price_per_month*subscriptions.subscription_length) DESC;

