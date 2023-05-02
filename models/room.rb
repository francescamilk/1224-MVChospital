require_relative "patient"

class Room
    def initialize(attributes = {})
        @capacity = attributes[:capacity]
        @patients = attributes[:patients] || []
    end
    
    attr_reader :patients
    attr_accessor :id
    
    def add_patient(patient)
        if @patients.count == @capacity
            raise StandardError, "sorry, room's full!"
        else
            # adding patient to @patients (Room)
            @patients << patient
            
            # assign the room as room of the patient (Patient)
            # self = the instance on which the method is called
            patient.room = self
        end
    end
end
