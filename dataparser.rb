# Write a Ruby program to first assemble a single set of records by parsing data from 
#3 different file formats and then display these records sorted in 3 different ways.



#Here's a general idea for you to start with

def open_file (record)
  File.open(record)
end

def split (split_param, item)
  item.split(split_param)
end

class Person
  attr_accessor :last_name, :first_name, :gender, :color, :date_of_birth

  def initialize(params={})
    @last_name = params[:last_name]
    @first_name = params[:first_name]
    @gender = params[:gender]
    @color = params[:color]
    @date_of_birth = params[:date_of_birth]
    @middle_initial = params[:middle_initial]
  end

end

open_file('comma.txt').each_with_index do |line, index|
  people = []
  people << Person.new(:last_name => split(', ', line)[0], 
                       :first_name => split(', ', line)[1])
  people[0]
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
