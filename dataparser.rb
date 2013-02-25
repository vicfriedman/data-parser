# Write a Ruby program to first assemble a single set of records by parsing data from 
#3 different file formats and then display these records sorted in 3 different ways.



#Here's a general idea for you to start with

class Person
  attr_accessor :last_name, :middle_initial, :first_name, :gender, :color, :date_of_birth

  @@all_people = []

  def initialize(params={})
    @last_name = params[:last_name]
    @middle_initial = params[:middle_initial]
    @first_name = params[:first_name]
    @gender = params[:gender]
    @color = params[:color]
    @date_of_birth = params[:date_of_birth]
    @middle_initial = params[:middle_initial]
    @@all_people << self
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


  def comma_person(line)
    @last_name = split(', ', line)[0]
    @first_name = split(', ', line)[1]
    @gender = split(', ', line)[2]
    @color = split(', ', line)[3]
    @date_of_birth = split(', ', line)[4].strip.gsub('-','/')
    @@all_people << self
  end


  def pipe_person (line)
    @last_name = split(' | ', line)[0]
    @first_name = split(' | ', line)[1]
    @middle_initial = split(' | ', line)[2]
    @gender = split(' | ', line)[3].gsub(/[FM]/,'F' => 'Female', 'M' => 'Male')
    @color = split(' | ', line)[4]
    @date_of_birth= split(' | ', line)[5].strip.gsub('-','/')
    @@all_people << self
  end

  def space_person(line)
    @last_name = split(' ', line)[0]
    @first_name = split(' ', line)[1]
    @middle_initial = split(' ', line)[2]
    @gender = split(' ', line)[3].gsub(/[FM]/,'F' => 'Female', 'M' => 'Male')
    @color = split(' ', line)[5]
    @date_of_birth = split(' ', line)[4].strip.gsub('-','/')
    @@all_people << self
  end

end

  def get_people(file_name)
  open_file(file_name).each do |line|
    if line.include?(', ')
      Person.all << comma_person(line)
    elsif line.include('| ')
      Person.all << pipe_person(line)
    else
      Person.all << space_person(line)
    end
  end
  Person.all
end

def output(people)
  people.each do |person|
    puts "#{person.last_name} #{person.first_name} #{person.gender} #{person.date_of_birth} #{person.color}"
  end
end

def sort_people
 get_people('comma.txt') + get_people('pipe.txt') + get_people('space.txt')
  # puts "Output 1: By Gender, then Last Name (ascending)"
  # output(people.sort_by {|person| person.gender})
  # puts "\n"
  # puts "Output 2: By Date of Birth (ascending)"
  # output(people.sort_by {|person| person.date_of_birth})
  # puts "\n"
  # puts "Output 3: By Last Name (descending)"
  # output(people.sort_by {|person| person.last_name}.reverse)
end








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
