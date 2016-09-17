@students = []

def interactive_menu
    loop do
       
        print_menu
       process(gets.chomp) 

    end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
end

def show_students
    print_header
    print_students_list
    print_footer
end

def process(selection)
    case selection
        when "1"
            selection = input_students
        when "2"
            show_students
        when "9"
            puts "Terminating programme"
            exit #closes programme
        else
            puts "Enter a selection from the list above"
    end
end

def input_students
    
    puts "Please enter the names of the students"
    puts "To finish, leave the name and hobby blank"
    
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
        @students << {name: name, hobby: hobby,cohort: cohort}
        puts "Now we have #{@students.count} student#{@students.count == 1 ? '' : 's'}"
        # get another name from the user
        puts "Enter another name or leave blank to end."
        name = gets.chop
        
        puts "Enter a cohort or leave blank to end."
        cohort = gets.chop
        
        puts "Enter a hobby or leave blank to end."
        hobby = gets.chop
    end
end
    
    
def print_header
    puts "The students of Villains Academy".center(40)
    puts "---------------".center(40)
end

def print_students_list
    
    #sort students by cohort (alphabetical order)
    @students.sort! {|a,b| a[:cohort] <=> b[:cohort]}
    
    #count of students printed
    current = 0
    
    #test whether all students have been iterated over
    while current < @students.count

        #Test if student name begins with a vowel and is less than 12 characters - prints if yes
        if @students[current][:name].start_with?("a","e","i","o","u","A","E","I","O","U") && @students[current][:name].length < 12 
            puts "#{current+1}. #{@students[current][:name]}. Likes #{@students[current][:hobby]}. (#{@students[current][:cohort]} cohort)".center(40)    
        end
    
    #increment the iterator
    current += 1
    
    end
end

def print_footer

    if @students == []
        puts "We currently have no students".center(40)
    else
        puts "Overall, we have #{@students.count} great student#{@students.count == 1 ? '' : 's'}".center(40)
    end
end

interactive_menu
