class Image #defining a class
  def initialize(data) #defining the initialize method #data is the argument(local variable)
    @data = data # assigning the local to an instance variable 
  end 
  def output_image #defining output_image 
    @data.each do |row| #looping with .each do #row is each row and what is given
      puts row.join #joins each row and then displays it #creates a string and joins all the values of the elements of the array into a string
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image

image2 = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 1, 0]
])
image2.output_image