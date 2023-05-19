class AtmSerializer
  include JSONAPI::Serializer 

  attributes :name,
             :address,
             :lat,
             :lon,
             :distance

  set_type :atm
end