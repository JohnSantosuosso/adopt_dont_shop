require 'rails_helper'

RSpec.describe Shelter, type: :model do
  describe 'relationships' do
    it { should have_many(:pets) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:rank) }
    it { should validate_numericality_of(:rank) }
  end

  before(:each) do
    @shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @shelter_2 = Shelter.create(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
    @shelter_3 = Shelter.create(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)

    @pet_1 = @shelter_1.pets.create(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: false)
    @pet_2 = @shelter_1.pets.create(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
    @pet_3 = @shelter_3.pets.create(name: 'Lucille Bald', breed: 'sphynx', age: 8, adoptable: true)
    @pet_4 = @shelter_1.pets.create(name: 'Ann', breed: 'ragdoll', age: 5, adoptable: true)
  end

  describe 'class methods' do
    describe '#search' do
      it 'returns partial matches' do
        expect(Shelter.search("Fancy")).to eq([@shelter_3])
      end
    end

    describe '#order_by_recently_created' do
      it 'returns shelters with the most recently created first' do
        expect(Shelter.order_by_recently_created).to eq([@shelter_3, @shelter_2, @shelter_1])
      end
    end

    describe '#order_by_reverse_alphabetical_by_name' do
      it 'returns shelters with the most recently created first' do
        expect(Shelter.order_by_reverse_alphabetical_by_name).to eq([@shelter_2, @shelter_3, @shelter_1])
      end
    end

    describe '#order_by_number_of_pets' do
      it 'orders the shelters by number of pets they have, descending' do
        expect(Shelter.order_by_number_of_pets).to eq([@shelter_1, @shelter_3, @shelter_2])
      end
    end
  end

  describe 'instance methods' do
    describe '.adoptable_pets' do
      it 'only returns pets that are adoptable' do
        expect(@shelter_1.adoptable_pets).to eq([@pet_2, @pet_4])
      end
    end

    describe '.alphabetical_pets' do
      it 'returns pets associated with the given shelter in alphabetical name order' do
        expect(@shelter_1.alphabetical_pets).to eq([@pet_4, @pet_2])
      end
    end

    describe '.shelter_pets_filtered_by_age' do
      it 'filters the shelter pets based on given params' do
        expect(@shelter_1.shelter_pets_filtered_by_age(5)).to eq([@pet_4])
      end
    end

    describe '.pet_count' do
      it 'returns the number of pets at the given shelter' do
        expect(@shelter_1.pet_count).to eq(3)
      end
    end
    describe '.filter_by_pets_pending_applications_alphabetically' do
      before :each do
        @pet_5 = @shelter_2.pets.create(name: 'Buffy', breed: 'shorthair', age: 3, adoptable: true)
        @app_1 = Application.create!(name: 'John Doe', street_address: '123 Main St', city: 'New York',
                                        state: 'NY', zipcode: 10_001)
        @app_2 = Application.create!(name: 'Jane Doe', street_address: '456 Main St', city: 'Boston',
                                          state: 'MA', zipcode: 10_002)
        @pet_app1 = PetApplication.create!(application_id: @app_1.id, pet_id: @pet_3.id, status: 'Pending')                                 
        @pet_app2 = PetApplication.create!(application_id: @app_2.id, pet_id: @pet_5.id, status: 'Pending')
      end
      it 'returns shelters that have pets w/pending apps, sorted alphabetically' do
        filtered = Shelter.filter_by_pets_with_pending_applications_alphabetically
        expect(filtered.length).to eq(2)
        expect(filtered[0].name).to eq('Fancy pets of Colorado')
      end
      describe '.pets_pending' do
        it 'returns the pets that have pending applications(not approved/rejected)' do
          # visit "/admin/shelters/#{@shelter_3.id}"
          # 'Lucille Bald'
          
          expect(@shelter_3.pets_pending.first).to eq(@pet_3)
        end
      end
      describe '.average_age_adoptable_pets' do
        it 'returns the average age of all adoptable pets for that shelter' do
          @pet_6 = @shelter_1.pets.create(name: 'Kita', breed: 'labrador', age: 4, adoptable: true)

          expect(@shelter_1.average_age_adoptable_pets).to eq(4)
        end
      end
    end
  end
end
