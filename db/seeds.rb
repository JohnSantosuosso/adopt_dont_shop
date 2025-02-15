PetApplication.destroy_all
Pet.destroy_all
Shelter.destroy_all
Application.destroy_all



dog_homes = Shelter.create!(name: "Dog Home", city: "Denver", rank: 1, foster_program: true)
paw_place = Shelter.create!(name: "Paw Place", city: "Boulder", rank: 2, foster_program: true)
furry_friends = Shelter.create!(name: "Furry Friends", city: "Aurora", rank: 3, foster_program: false)

application_1 = Application.create!(name: "John Doe", street_address: "123 Main St", city: "New York", state: "NY", zipcode: 20001)
application_2 = Application.create!(name: "Jane Doe", street_address: "456 Main St", city: "Boston", state: "MA", zipcode: 30002)
application_3 = Application.create!(name: "Joe Smith", street_address: "789 Main St", city: "Seattle", state: "WA", zipcode: 40003)
application_4 = Application.create!(name: "Sally Jackson", street_address: "123 Mulberry St", city: "Denver", state: "CO", zipcode: 50004)
application_5 = Application.create!(name: "Bob Jones", street_address: "456 Mulberry St", city: "Boulder", state: "CO", zipcode: 60005)
application_6 = Application.create!(name: "Sue Smith", street_address: "789 Mulberry St", city: "Aurora", state: "CO", zipcode: 70006)

dog_1 = Pet.create!(name: "Fido", breed: "Poodle", age: 2, adoptable: true, shelter_id: dog_homes.id)
dog_2 = Pet.create!(name: "Buddy", breed: "Poodle", age: 3, adoptable: true, shelter_id: dog_homes.id)
dog_3 = Pet.create!(name: "Bella", breed: "Labrador", age: 4, adoptable: true, shelter_id: dog_homes.id)
dog_4 = Pet.create!(name: "Roofus", breed: "Pit Bull", age: 3, adoptable: true, shelter_id: paw_place.id)
dog_5 = Pet.create!(name: "Bow-wow", breed: "Labrador", age: 4, adoptable: true, shelter_id: paw_place.id)
dog_6 = Pet.create!(name: "Spot", breed: "Pit Bull", age: 4, adoptable: true, shelter_id: paw_place.id)
dog_7 = Pet.create!(name: "Jack", breed: "Labrador", age: 6, adoptable: true, shelter_id: paw_place.id)
dog_8 = Pet.create!(name: "Nick", breed: "Hound", age: 14, adoptable: true, shelter_id: furry_friends.id)
dog_9 = Pet.create!(name: "Beast", breed: "Pit Bull", age: 10, adoptable: true, shelter_id: furry_friends.id)
dog_10 = Pet.create!(name: "Randy", breed: "Hound", age: 6, adoptable: true, shelter_id: furry_friends.id)

pet_app_1 = PetApplication.create!(application_id: application_1.id, pet_id: dog_1.id, status: 'Pending')
pet_app_2 = PetApplication.create!(application_id: application_1.id, pet_id: dog_4.id, status: 'Pending')
pet_app_3 = PetApplication.create!(application_id: application_2.id, pet_id: dog_1.id, status: 'Pending')

p "Created #{Shelter.count} Shelters"
p "Created #{Application.count} Applications"
p "Created #{Pet.count} Pets"
p "Created #{PetApplication.count} Pet Applications"
