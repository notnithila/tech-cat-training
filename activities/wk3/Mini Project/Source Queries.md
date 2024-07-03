```sql
-- validate your tables once data is loaded

select f.*
from fact_accidents as f 
join dim_accident_type as dim_a on f.accident_type_id = dim_a.accident_type_id
join dim_body_style as dim_b on f.body_style_id = dim_b.body_style_id
join dim_placeholder as dim_p on f.policyholder_id = dim_p.policyholder_id
join dim_states as dim_s on f.state_id = dim_s.state_id
join dim_gender_marital as dim_g on f.gender_maritalstatus_id = dim_g.gender_maritalstatus_id
join dim_vehicle_use as dim_v on f.vehicle_usecode_id = dim_v.vehicle_usecode_id
limit 100;
```

