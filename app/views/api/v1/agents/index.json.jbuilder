json.array! @agents.each do |agent|
  json.id agent.id
  json.field_name agent.field_name
  json.base agent.base
  json.deployment_date agent.deployment_date
  json.id_visible true
end