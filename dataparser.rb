# Write a Ruby program to first assemble a single set of records by parsing data from 
#3 different file formats and then display these records sorted in 3 different ways.



#Here's a general idea for you to start with
require 'pry'
class Person
  attr_accessor :last_name, :middle_initial, :first_name, :gender, :color, :date_of_birth, :line_split

  @@all_people = []

  def initialize(line)
    @line = line
    find_line_type
  end

  def find_line_type
    if @line.include?(', ')
      comma_person
    elsif @line.include?('| ')
      pipe_person
    else
      space_person
    end
  end

  def self.all
    @@all_people
  end

  def open_file(record)
    File.open(record)
  end

  def split(split_param, item)
    item.split(split_param)
  end


  def comma_person
    @line_split = @line.split(', ')
    @last_name =  @line_split[0]
    @first_name =  @line_split[1]
    @gender =  @line_split[2]
    @color =  @line_split[3]
    @date_of_birth =  @line_split[4].strip.gsub('-','/')
  end


  def pipe_person
    @line_split = @line.split('| ')
    @last_name = @line_split[0]
    @first_name = @line_split[1]
    @middle_initial = @line_split[2]
    @gender = @line_split[3].gsub(/[FM]/,'F' => 'Female', 'M' => 'Male')
    @color = @line_split[4]
    @date_of_birth= @line_split[5].strip.gsub('-','/')
    
  end

  def space_person
    @line_split = @line.split('| ')
    @last_name = @line_split[0]
    @first_name = @line_split[1]
    @middle_initial = @line_split[2]
    @gender = @line_split[3].to_s.gsub(/[FM]/,'F' => 'Female', 'M' => 'Male')
    @color = @line_split[5]
    @date_of_birth = @line_split[4].to_s.strip.gsub('-','/')
  end

end

  def get_people(file_name)
  open_file(file_name).each do |line|
    if line.include?(', ')
      @@all_people << comma_person(line)
    elsif line.include('| ')
      @@all_people << pipe_person(line)
    else
      @@all_people << space_person(line)
    end
  end
  Person.all
end

def output(people)
  people.each do |person|
    puts "#{person.last_name} #{person.first_name} #{person.gender} #{person.date_of_birth} #{person.color}"
  end
end

files = ["comma.txt", "pipe.txt", "space.txt"]

files.each do |file|
  File.readlines(file).each do |line|
    Person.new(line)
  end
end
binding.pry
Person.all ## still returning an empty array

# def sort_people
#  get_people('comma.txt') + get_people('pipe.txt') + get_people('space.txt')


#   # puts "Output 1: By Gender, then Last Name (ascending)"
#   # output(people.sort_by {|person| person.gender})
#   # puts "\n"
#   # puts "Output 2: By Date of Birth (ascending)"
#   # output(people.sort_by {|person| person.date_of_birth})
#   # puts "\n"
#   # puts "Output 3: By Last Name (descending)"
#   # output(people.sort_by {|person| person.last_name}.reverse)
# end








# split_param = ', '
# split_param = ' | '
# split_param = ' '






# INPUT DATA

# A record consists of the following 5 fields: last name, first name, gender, 
#date of birth and favorite color. You will be given 3 files, each containing records 
#stored in a different format.

# The pipe-delimited file lists each record as follows:
# LastName | FirstName | MiddleInitial | Gender | FavoriteColor | DateOfBirth

# The comma-delimited file looks like this:
# LastName, FirstName, Gender, FavoriteColor, DateOfBirth

# The space-delimited file looks like this:
# LastName FirstName MiddleInitial Gender DateOfBirth FavoriteColor

# You may assume that the delimiters (commas, pipes and spaces) do not appear 
#anywhere in the data values themselves. Write a Ruby program to read in records 
#from these files and combine them into a single set of records.


# DISPLAY REQUIREMENTS
# Create and display 3 different views of the recordset (see a sample):
# Output 1 – sorted by gender (females before males) then by last name ascending.
# Output 2 – sorted by birth date, ascending.
# Output 3 – sorted by last name, descending.
# Ensure that fields are displayed in the following order: last name, first name, 
  #gender, date of birth, favorite color.
# Display dates in the format MM/DD/YYYY.
