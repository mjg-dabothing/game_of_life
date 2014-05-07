# require your game of life class
require File.join(File.dirname(__FILE__), 'game_of_life')
require File.join(File.dirname(__FILE__), 'life_ncurses')

LifeNcurses.new(GameOfLife.new(20), 100)
