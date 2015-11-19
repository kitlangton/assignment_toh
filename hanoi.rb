class Hanoi

  attr_reader :height

  def initialize(height)
    @height = height
    @tower = [[],[],[]]
  end

  def start
    play
    loop do
      puts render
      puts "Enter origin and destination"
      input = gets.chomp

      if input == "quit"
        puts "noooo o\n1  2  3"
        return
      end

      if input !~ /\A\d+,\d+\z/
        puts "Enter 2 numbers separated by a comma, e.g. 1,3"
        redo
      end

      origin, destination = input.split(",")

      move(origin.to_i,destination.to_i)

      if @tower[@height-1] == @solution
        puts "You Win!"
        return
      end
    end
  end

  def play
    height.times do |i|
      @tower[0] << i+1
    end

    @solution = @tower[0].dup
  end

  def render
    columns = []

    @height.times do |i|
      columns << render_column(i)
    end

    output = []

    (@height + 1).times do |i|
      row = []
      columns.each do |col|
        row << col[i]
      end
      output << row
    end

    output.map(&:join).join("\n")
  end


  def render_column(column)
    output = []
    values = @tower[column]


    (height - values.count).times do 
      output << " " * @height
    end

    @height.times do |i|
      if values[i]
        output << render_block(values[i])
      end
    end

    output << "#{column + 1}".ljust(@height)

    output

  end

  def render_block(width)
    block = "o" * width
    block.ljust(@height)
  end

  def move(origin,destination)

    if @tower[origin-1][0].nil?
      puts "You must select a column with a block"
      return
    end

    if origin < 1 || origin > @height
      puts "Your origin and destination must be a number from 1 to #{@height}"
      return
    end

    if destination < 1 || destination > @height
      puts "Your origin and destination must be a number from 1 to #{@height}"
      return
    end

    if @tower[destination-1][0].nil? || @tower[origin-1][0] < @tower[destination-1][0]
      @tower[destination-1].unshift(@tower[origin-1].shift)
    else
      puts "You can only move a piece onto a wider piece or the ground."
    end
  end

end
