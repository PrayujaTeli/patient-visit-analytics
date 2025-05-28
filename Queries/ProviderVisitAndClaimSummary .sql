--List each provider along with the total number of visits they have conducted and the total claim amount for those visits.

select pr.provider_name, COUNT(v.visit_id) as TotalVisits, SUM(c.amount) as TotalAmount from Provider pr
Join Visit v on pr.provider_id = v.provider_id
Join claim c on v.visit_id = c.visit_id
group by pr.provider_name

