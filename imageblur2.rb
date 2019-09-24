class Image #defining a class
  def initialize(data) #defining the initialize method #data is the argument(local variable)
    @data = data # assigning the local to an instance variable 
  end 
  def output_image #defining output_image 
    @data.each do |row| #looping with .each do #row is each row and what is given
      puts row.join #joins each row and then displays it #creates a string and joins all the values of the elements of the array into a string
    end
  end
  def blur 
    coordinates=[]
    @data.each_with_index do |row,row_index| 
      row.each_with_index do |pixel,pixel_index|
        if pixel == 1 
          coordinates << [row_index, pixel_index]
          puts "found a pixel at #{row_index} and #{pixel_index}"
          #@data[row_index-1][pixel_index]=1 #over
          #@data[row_index+1][pixel_index]=1 #under
          #@data[row_index][pixel_index-1]=1 #left
          #@data[row_index][pixel_index+1]=1 #right

        end
      end
    end
    coordinates.each do |coord| 


      row_index = coord[0]
      pixel_index = coord[1]
      @data[row_index-1][pixel_index]=1 unless row_index-1 < 0
      @data[row_index+1][pixel_index]=1 unless row_index+1 > @data.length-1 #over
      @data[row_index][pixel_index-1]=1 unless pixel_index-1 < 0
      @data[row_index][pixel_index+1]=1 unless pixel_index+1 > @data.length-1
    end 
  end 
end

image = Image.new([
  [1, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.blur
image.output_image

image2 = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 1, 0]
])
image2.blur 
image2.output_image