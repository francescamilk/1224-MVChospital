require "csv"
require_relative "../models/patient"

class PatientRepository
    def initialize(csv_file)
        @csv_file = csv_file
        @patients = []
        @next_id  = 1
        
        load_csv()
    end

    attr_reader :patients

    def create(patient)
        @patients << patient
        # assign an id to the patient
        patient.id = @next_id
        @next_id   = @patients.last.id += 1

        # TODO: save_csv()
    end
    
    private
    
    def load_csv
        CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
            # #<CSV::Row "name":"john" "cured":"true">
            id    = row[:id].to_i
            name  = row[:name]
            cured = row[:cured] == "true"
            
            
            # create Patient instance
            patient = Patient.new(id: id, name: name, cured: cured)
            # push the instance in @patients
            @patients << patient
            
            # we need the id of the room
            room_id = row[:room_id].to_i
            # we need to find the room
            @room_repo.find(room_id)
            # we need to connect room to patient
            patient.room = room
        end
        @next_id = @patients.last.id + 1 unless @patients.empty?
    end
end

repo  = PatientRepository.new("./data/patients.csv")
jenny = Patient.new(name: "jenny")
repo.create(jenny)

p repo.patients
