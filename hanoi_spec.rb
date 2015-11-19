require_relative 'hanoi'

describe Hanoi do

  context 'new board' do

    it 'has a height' do
      h = Hanoi.new(3)
      expect(h.height).to eq 3
    end

    it 'renders a block' do
      h = Hanoi.new(3)
      expect(h.render_block(2)).to eq "oo "
    end

    it 'renders a column' do

      output = ['o  ', 'oo ', 'ooo','1  ']
      h = Hanoi.new(3)
      h.play
      expect(h.render_column(0)).to eq output
    end

    it 'renders the board' do
      h = Hanoi.new(3)

      output = <<-EOF.chomp
o        
oo       
ooo      
1  2  3  
      EOF

      h.play

      expect(h.render).to eq output
    end

    it 'can move a piece' do
      h = Hanoi.new(3)
      h.play
      h.move(1,3)
      output = <<-EOF.chomp
         
oo       
ooo   o  
1  2  3  
      EOF

      expect(h.render).to eq output

    end
  end
end
