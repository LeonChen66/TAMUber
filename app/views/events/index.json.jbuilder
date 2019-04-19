json.array! @events do |event|
  date_format = event.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
  json.id event.id
  json.type 'multiColAgenda'
  json.title event.title
  json.start event.start.strftime(date_format)
  json.end event.end.strftime(date_format)
  json.driver_id event.driver_id unless event.driver_id.blank?
  json.allDay false
  json.update_url event_path(event, method: :patch)
  json.edit_url edit_event_path(event)
  json.column @col[event.driver_id]
end
