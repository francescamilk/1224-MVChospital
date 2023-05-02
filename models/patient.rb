class Patient
    def initialize(attributes = {})
        @id         = attributes[:id]
        @name       = attributes[:name]
        @cured      = attributes[:cured] || false
        @blood_type = attributes[:blood_type]
    end

#    attr_reader :room
#    attr_writer :room
   attr_accessor :room, :id

    def cured?
        @cured
    end

    def cure!
        @cured = true
    end
end
