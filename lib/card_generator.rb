class CardGenerator

  def initialize(filename)
    @filename = filename
  end

  def cards

    contents = CSV.readlines "#{@filename}"
    card_list = contents.map do |row|
      Card.new(row[0], row[1], row[2])
    end
    card_list
  end

end
