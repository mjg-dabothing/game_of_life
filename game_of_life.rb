#
# Conway's Game of Life implementation.
# Ruby version 1.8.7
# Developed in Linux Mint virtual machine running in VirtualBox.
#

class GameOfLife

    def initialize(dimension = 5)
        #@state = [[0, 1, 0], [0, 1, 0], [0, 1, 0]]
        @state = []
        (0...dimension).each do |row|
            state[row] = []
            (0...dimension).each do |col|
                space = rand(2) #0 or 1.
                state[row] << space
            end
        end
    end

    def evolve()
        @state.each_with_index do |row, row_index|
            row.each_with_index do |col, col_index|
            end
        end
        return @state
    end

    attr_accessor :state

end
