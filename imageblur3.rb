class Image #defining a class
  def initialize(data) #defining the initialize method #data is the argument(local variable)
    @data = data # assigning the local to an instance variable 
  end 

  def output_image #defining output_image 
    @data.each do |row| #looping with .each do #row is each row and what is given
      puts row.join #joins each row and then displays it #creates a string and joins all the values of the elements of the array into a string
    end
  end

  def blur (distance)
    ones = coordinates
     @data.each_with_index do |row,row_index| 
      row.each_with_index do |pixel,pixel_index|
        ones.each do |coord|
          if manhattan_distance(row_index, pixel_index,coord[0], coord[1]) <= distance 
            @data[row_index][pixel_index] = 1
          end

        end
      end
    end

   
    #coordinates.each do |coord| 


     # pixel_index = coord[1]
      #@data[row_index-1][pixel_index]=1 unless row_index-1 < 0
      #@data[row_index+1][pixel_index]=1 unless row_index+1 > @data.length-1 #over
      #@data[row_index][pixel_index-1]=1 unless pixel_index-1 < 0
      #@data[row_index][pixel_index+1]=1 unless pixel_index+1 > @data.length-1
    #end 
  end 

  def coordinates
     coordinates=[]
    @data.each_with_index do |row,row_index| 
      row.each_with_index do |pixel,pixel_index|
        if pixel == 1 
          coordinates << [row_index, pixel_index]
          #puts "found a pixel at #{row_index} and #{pixel_index}"
          #@data[row_index-1][pixel_index]=1 #over
          #@data[row_index+1][pixel_index]=1 #under
          #@data[row_index][pixel_index-1]=1 #left
          #@data[row_index][pixel_index+1]=1 #right

        end
      end
    end
    return coordinates
  end
  def manhattan_distance (coor1row,coor1col,coor2row,coor2col)
    (coor1row - coor2row).abs + (coor1col - coor2col).abs
  end
end

image = Image.new([
  [1, 0, 0, 0,0,0,0,0,0],
  [0, 1, 0, 0,0,0,0,0,0],
  [0, 0, 0, 1,0,0,0,0,0],
  [0, 0, 0, 0,0,0,0,0,0],
  [0, 0, 0, 0,0,0,0,0,0],
  [0, 1, 0, 0,0,0,0,0,0],
  [0, 0, 0, 1,0,0,0,0,0],
  [0, 0, 1, 0,0,0,0,0,0]
])
image.blur(1)
image.output_image

image2 = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 1, 0]
])
image2.blur(1) 
image2.output_image