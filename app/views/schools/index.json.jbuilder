json.array!(@schools) do |school|
  json.extract! school, :id, :name, :no_of_students
  json.url school_url(school, format: :json)
end
