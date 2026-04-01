{% set cols = ['id', 'name', 'email'] %}

SELECT
    {% for col in cols %}
        {{ col }}{% if not loop.last %},{% endif %}
    {% endfor %}
FROM users