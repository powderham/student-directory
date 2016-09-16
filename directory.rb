def input_students
    
    
    #Cohort information - REGEX
    
    #puts "Enter month number for cohort Jan-Dec 1-12"

    #month = gets.chomp.to_i
  
    #until month =~ /^[1-9]|1[0-2]$/
    #    puts "Enter a month for the cohort 1-12."
    #    month = gets.chomp.to_i
    #end
    
    #months = [:January,
    #    :February,
    #    :March,
    #    :April,
    #    :May,
    #    :June,
    #    :July,
    #    :August,
    #    :September,
    #    :October,
    #    :November,
    #    :December
    #] 
    

    #puts "You have chosen the  #{months[month-1]} cohort"
    
    #puts ""
    
    puts "Please enter the names of the students"
    puts "To finish, leave the name and hobby blank"
    
    #create an empty array
    students = []
    
    #get the first name
    puts "Enter a name."
    name = gets.chop
    
    puts "Enter a cohort."
    cohort = gets.chop
    
    puts "Enter a hobby."
    hobby = gets.chomp
    
    #while the name is not empty, repeat this code
    while !name.empty? do
        #add the student hash to the array
        students << {name: name, hobby: hobby,cohort: cohort}
        puts "Now we have #{students.count} student#{students.count == 1 ? '' : 's'}"
        # get another name from the user
        puts "Enter another name or leave blank to end."
        name = gets.chop
        
        puts "Enter a cohort or leave blank to end."
        cohort = gets.chop
        
        puts "Enter a hobby or leave blank to end."
        hobby = gets.chop
    end
    
    #return array of the students
    students
end
    
    
def print_header
    puts "The students of Villains Academy".center(40)
    puts "---------------".center(40)
end

def print(students)
    
    #sort students by cohort (alphabetical order)
    students.sort! {|a,b| a[:cohort] <=> b[:cohort]}
    
    #count of students printed
    current = 0
    
    #test whether all students have been iterated over
    while current < students.count

        #Test if student name begins with a vowel and is less than 12 characters - prints if yes
        if students[current][:name].start_with?("a","e","i","o","u","A","E","I","O","U") && students[current][:name].length < 12 
            puts "#{current+1}. #{students[current][:name]}. Likes #{students[current][:hobby]}. (#{students[current][:cohort]} cohort)".center(40)    
        end
    
    #increment the iterator
    current += 1
    
    end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great student#{students.count == 1 ? '' : 's'}".center(40)
end

students = input_students

if students == []
    puts "No students, terminating."
else
    print_header
    print(students)
    print_footer(students)   
end

