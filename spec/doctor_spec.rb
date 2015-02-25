require 'spec_helper'

describe(Doctor) do

  describe('#name') do
    it("will return the name of the doctor") do
    test_doctor = Doctor.new({:name => "Dr. Sues", :id => nil, :specialty => "EMT"})
    expect(test_doctor.name()).to(eq("Dr. Sues"))
  end
end

  describe(".all") do
    it("will start off with no doctors") do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe "#save" do
    it "add doctors to the list" do
      test_doctor = Doctor.new({:name => "Dr. House", :id => nil, :specialty => "Sports Medicine"})
      test_doctor.save
      expect(Doctor.all).to eq ([test_doctor])
    end
  end

  describe ".find" do
    it("returns a doctor by their ID") do
      test_doctor = Doctor.new({:name => "Dr. House", :id => nil, :specialty => "Sports Medicine"})
      test_doctor.save
      test_doctor2 = Doctor.new({:name => "Dr. bob", :id => nil, :specialty => "Dentist"})
      test_doctor2.save
      expect(Doctor.find(test_doctor2.id())).to eq (test_doctor2)
    end
  end

  describe ".specialty" do
    it "gives the specialty of a doctor" do
      test_doctor = Doctor.new({:name => "Dr. bob", :id => nil, :specialty => "Dentist"})
      test_doctor.save
      expect(test_doctor.specialty).to eq "Dentist"
    end
  end

  describe '#patients' do
    it 'will return array or patients for doctors' do
      test_doctor = Doctor.new({:name => "Dr. bob", :id => nil, :specialty => "Dentist"})
      test_doctor.save
      test_patient2 = Patient.new(:name => "Samantha", :birthday => "2003-01-15", :doctor_id => test_doctor.id)
      test_patient2.save
      expect(test_doctor.patients).to eq ([test_patient2])
    end
  end

  describe "#==" do
    it "is the same doctor if it has the same info and id" do
      test_doctor = Doctor.new({:name => "Dr. House", :id => nil, :specialty => "Sports Medicine"})
      test_doctor2 = Doctor.new({:name => "Dr. House", :id => nil, :specialty => "Sports Medicine"})
      expect(test_doctor).to eq (test_doctor2)
    end
  end
end
