#
# Conway's Game of Life implementation.
# Ruby version 1.8.7
# Developed in Linux Mint virtual machine running in VirtualBox.
#

class GameOfLife

    def initialize(dimension = 5)
        #@state = [[0, 1, 0], [0, 1, 0], [0, 1, 0]]
        @state = []
        (0...dimension).each do |row_index|
            state[row_index] = []
            (0...dimension).each do |col_index|
                space = rand(2) #0 or 1.
                state[row_index] << space
            end
        end
    end

    def evolve()
        newstate = @state
        @state.each_with_index do |row, row_index|
            row.each_with_index do |col, col_index|
                neighbor_count = num_neighbors(row_index, col_index)
                if (neighbor_count < 2 || neighbor_count > 3)
                    newstate[row_index][col_index] = 0
                end
                if (neighbor_count == 3)
                    newstate[row_index][col_index] = 1
                end
            end
        end
        @state = newstate
        return @state
    end

    def num_neighbors(row_index, col_index)
        num_neighbors = 0;
        (row_index-1..row_index+1).each do |neighbor_row_index|
            (col_index-1..col_index+1).each do |neighbor_col_index|
                unless row_index == neighbor_row_index && col_index == neighbor_col_index
                    neighbor_row = neighbor_row_index % @state.size
                    neighbor_col = neighbor_col_index % @state[neighbor_row].size
                    if @state[neighbor_row][neighbor_col] == 1
                        num_neighbors += 1
                    end
                end
            end
        end
        return num_neighbors
    end

    attr_accessor :state

end
