class Doctor
  attr_reader :name, :id, :specialty

  def initialize(attributes) #same as === define_method(:initialize) do |attributes|
    @name = attributes[:name] #name = attributes.fetch("name")
    @id = attributes[:id]
    @specialty = attributes[:specialty]
  end

  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each do |doctor|
      name = doctor["name"]
      id = doctor["id"].to_i
      specialty = doctor["specialty"]
      doctors << Doctor.new({:name => name, :id => id, :specialty => specialty})
    end
    doctors
  end

  def save
   result = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
     @id = result.first["id"].to_i   #result.first.fetch("id")
   end

   def self.find(identification)
     found_doctor = nil
    Doctor.all.each do |doctor|
       if doctor.id().== identification
         found_doctor = doctor
       end
     end
     found_doctor
   end

   def ==(another_doctor)
     self.name().==(another_doctor.name()).&(self.specialty.==(another_doctor.specialty)).&(self.id.==(another_doctor.id))
   end

   def patients
     doctor_patients = []
     new_patients = DB.exec("SELECT * FROM patients WHERE doctor_id = #{self.id()};")
     new_patients.each do |patient|
       name = patient["name"]
       birthday = patient["birthday"]
       doctor_id = patient["doctor_id"].to_i
       doctor_patients << Patient.new({:name => name, :birthday => birthday, :doctor_id => doctor_id})
     end
     doctor_patients
   end
end
