# Rules 
#   each cell 2 possible states, life of death 
#   8 neighbours 
#    - any life cell < 2 neighbours dies 
#    - any life cell > 3 neighbours dies
#    - any live cell with 2 or 3 neighbours lives to next generation
#    - any dead cell with exactly 3 live neighbours becomes a live cell
# first generation: apply pattern
# 



require File.join(File.dirname(__FILE__), 'game_of_life')
require 'rubygems'
require 'test/unit'

class GameOfLifeTest < Test::Unit::TestCase

    def setup
        @game3 = GameOfLife.new(3)
        @game5 = GameOfLife.new(5)
    end

    def test_should_kill_with_no_neighbours
        @game3.state = [[1,0,0],[0,0,0],[0,0,0]]
        after = @game3.evolve
        assert_equal after[0][0], 0
    end

    def test_should_kill_with_just_one_neighbour
        @game3.state = [[0,0,0],[1,0,0],[1,0,0]]
        after = @game3.evolve
        assert_equal after[1][0], 0
        assert_equal after[2][0], 0
    end

    def test_should_kill_with_more_than_3_neighbours
        @game3.state = [[1,1,1],[1,1,1],[1,1,1]]
        after = @game3.evolve
        assert_equal after, [[0,0,0],[0,0,0],[0,0,0]]
    end

    def test_should_give_birth_if_3_neighbours
        @game3.state = [[1,0,0],[1,1,0],[0,0,0]]
        after = @game3.evolve
        assert_equal after, [[1,1,1],[1,1,1],[1,1,1]]
    end

    def test_should_oscillate_blinker_vertical
        @game5.state = [[0,0,0,0,0],[0,0,1,0,0],[0,0,1,0,0],[0,0,1,0,0],[0,0,0,0,0]] #blinker, vertical state
        after = @game5.evolve
        assert_equal after, [[0,0,0,0,0],[0,0,0,0,0],[0,1,1,1,0],[0,0,0,0,0],[0,0,0,0,0]] #blinker, horizontal state
    end

    def test_should_oscillate_blinker_horizontal
        @game5.state = [[0,0,0,0,0],[0,0,0,0,0],[0,1,1,1,0],[0,0,0,0,0],[0,0,0,0,0]] #blinker, horizontal state
        after = @game5.evolve
        assert_equal after, [[0,0,0,0,0],[0,0,1,0,0],[0,0,1,0,0],[0,0,1,0,0],[0,0,0,0,0]] #blinker, vertical state
    end

    def test_should_be_stable_with_2x2_block
        @game5.state = [[0,0,0,0,0],[0,1,1,0,0],[0,1,1,0,0],[0,0,0,0,0],[0,0,0,0,0]] #block
        after = @game5.evolve
        assert_equal after, [[0,0,0,0,0],[0,1,1,0,0],[0,1,1,0,0],[0,0,0,0,0],[0,0,0,0,0]] #block
    end

    def test_should_be_stable_with_boat
        @game5.state = [[0,0,0,0,0], [0,1,1,0,0], [0,1,0,1,0], [0,0,1,0,0], [0,0,0,0,0]] #boat
        after = @game5.evolve
        assert_equal after, [[0,0,0,0,0], [0,1,1,0,0], [0,1,0,1,0], [0,0,1,0,0], [0,0,0,0,0]] #boat
    end



end
