json.extract! trip, :id, :team_name, :start_time, :end_time, :team_size, :lodging, :project, :excursion, :when_excursion, :excursion_days, :created_at, :updated_at
json.url trip_url(trip, format: :json)
