class RoomRepository
    def initialize(csv_file)
        @csv_file = csv_file
        @rooms    = []
    end

    def find(id)
        @rooms.find do |room|
            room.id == id
        end
    end

    private

    # def load_csv
end