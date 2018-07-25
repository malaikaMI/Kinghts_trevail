# Create a 8*8 board 
class Board
    attr_accessor :board
    def initialize
      @board = []
      (0..7).to_a.each do |i|
        (0..7).to_a.each do |j|
          @board << [i, j]
        end 
      end 
    end 
  end 
  # Finds all possible moves from a single position 
  class Vertex
    attr_accessor :position, :neighbors, :parent
    def initialize(position, parent=nil)
      @position = position
      @neighbors = []
      @neighbors << [@position[0] + 1, @position[1] + 2]
      @neighbors << [@position[0] + 1, @position[1] - 2]
      @neighbors << [@position[0] + 2, @position[1] + 1]
      @neighbors << [@position[0] + 2, @position[1] - 1]
      @neighbors << [@position[0] - 1, @position[1] + 2]
      @neighbors << [@position[0] - 1, @position[1] - 2]
      @neighbors << [@position[0] - 2, @position[1] + 1]
      @neighbors << [@position[0] - 2, @position[1] - 1]
      @neighbors.delete_if { |a, b| a < 0 || a > 7 || b < 0 || b > 7 }
      @parent = parent 
    end 
  end
  # Finds the shortest path between two positions
  def knight_moves(start, finish)
    queue = []
    current = Vertex.new(start)
    # Move to finish position by BFS and keep track of each element's parent
    until current.position == finish 
      current.neighbors.each { |p| queue << Vertex.new(p, current) }
      current = queue.shift
    end
    road = []
    # Move back to start position through each element's parent
    until current.position == start 
      road << current.position
      current = current.parent 
    end 
    road << current.position
    # Returns the shortest path from start to finish 
    puts "You made it in #{road.length - 1} moves! Here's your path:"
    road.reverse.each { |pos| p pos }
  end 
  
  knight_moves([3,3], [4,3])