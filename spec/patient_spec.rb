require 'spec_helper'

describe(Patient) do

  describe "#name" do
    it("gives the name of the patient") do
      test_patient = Patient.new({:name => "Bob Ross", :birthday => "1980-03-15", :doctor_id => 2})
      test_patient.save
      expect(test_patient.name).to eq ("Bob Ross")
    end
  end

  describe "#birthday" do
    it "give the birthday or a patient" do
      test_patient = Patient.new({:name => "Samantha", :birthday => "2003-01-30", :doctor_id => 4})
      test_patient.save
      expect(test_patient.birthday).to eq ("2003-01-30")
    end
  end

  describe ".all" do
    it("starts off with an empty array") do
      expect(Patient.all).to eq ([])
    end
  end

  describe "#==" do
    it("is the same patient if it has the same info") do
      test_patient1 = Patient.new({:name => "Bob Ross", :birthday => "1980-03-15", :doctor_id => 2})
      test_patient2 = Patient.new({:name => "Bob Ross", :birthday => "1980-03-15", :doctor_id => 2})
      expect(test_patient1).to eq (test_patient2)
    end
  end

  describe "#save" do
    it("saves a patient to the list") do
      test_patient3 = Patient.new({:name => "Samantha", :birthday => "2003-01-30", :doctor_id => 4})
      test_patient3.save
      expect(Patient.all).to eq ([test_patient3])
    end
  end

  describe ".doctor_id" do
    it("gives the doctor id for a patient") do
      test_patient = Patient.new({:name => "Samantha", :birthday => "2003-01-30", :doctor_id => 4})
      test_patient.save
      expect(test_patient.doctor_id).to eq (4)
    end
  end
end
