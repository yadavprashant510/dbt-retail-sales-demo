with bronze_sale as (
    select sales_id,
    product_sk,
    customer_sk,
    {{ multiply('quantity', 'unit_price') }} as calc_gross_amount,
    gross_amount,
    payment_method
    from {{ ref('bronze_sale') }}
),
bronze_product as (
    select product_sk,
    category
    from {{ ref('bronze_product') }}
),

bronze_customer as (
    select customer_sk,
    gender
    from {{ ref('bronze_customer') }}
),

joined_query as (
select
    s.sales_id,
    s.product_sk,
    s.gross_amount,
    s.payment_method,
    p.category,
    c.gender
from 
    bronze_sale as s
join
    bronze_product as p on s.product_sk = p.product_sk
join
    bronze_customer as c on s.customer_sk = c.customer_sk
)

select 
    category,
    gender,
    count(*) as total_sales,
    round(sum(gross_amount),2) as total_gross_amount
from 
    joined_query
group by
    category, gender
order by
    total_gross_amount desc
