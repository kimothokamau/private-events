json.extract! invitation, :id, :attended_event_id, :attendee_id, :created_at, :updated_at
json.url invitation_url(invitation, format: :json)
