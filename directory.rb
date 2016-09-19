@students = []

def interactive_menu
    loop do
       print_menu
       process(STDIN.gets.chomp)
    end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list of students"
    puts "4. Load the list of students"
    puts "9. Exit"
end

def show_students
    print_header
    print_students_list
    print_footer
end

def process(selection)
    puts "Option #{selection} selected"
    puts ""
    case selection
        when "1"
            selection = input_students
        when "2"
            show_students
        when "3"
            save_students
        when "4"
            load_students
        when "9"
            puts "Terminating programme"
            exit #closes programme
        else
            puts "Enter a selection from the list above"
    end
end

def input_students
    
    count = 0
    
    puts "Please enter the names of the students"
    puts "To finish, leave the name and hobby blank"
    
    #get the first name
    puts "Enter a name."
    name = STDIN.gets.chop
    
    puts "Enter a cohort."
    cohort = STDIN.gets.chop

    #while the name is not empty, repeat this code
    while !name.empty? do
        #add the student hash to the array
        add_students(name,cohort)
        count += 1
        puts "Now we have #{@students.count} student#{@students.count == 1 ? '' : 's'}"
        # get another name from the user
        puts "Enter another name or leave blank to end."
        name = STDIN.gets.chop
        
        puts "Enter a cohort or leave blank to end."
        cohort = STDIN.gets.chop
        
    end
    
    puts "#{count} new students sucsessfully added."
    puts ""
    
    
end

def add_students(name, cohort)
    @students << {name: name, cohort: cohort}
end

def try_load_students

    filename = ARGV.first == nil ? "students.csv" : RGV.first
    return if filename.nil? #if no filename given then end method
    
    if File.exists?(filename)
        load_students(filename) 
    else
        puts "Sorry, #{filename} doesn't exist"
        exit
    end
end

def load_students(filename = "students.csv")
    
    count = 0
    
    File.open("students.csv", "r") do |f|
        f.readlines.each do |line|
            name, cohort = line.chomp.split(',')
                add_students(name, cohort)
            count +=1
        end
    end
    
    puts "" 
    puts "#{count} student#{@students.count == 1 ? '' : 's'} loaded from #{filename}."
    puts ""
end

def save_students
    
    puts "Enter a filename to save to e.g. students.csv"
    location = gets.chomp
    
    count = 0
    
    File.open(location,"w") do |f|
        @students.each do |student|
            student_data = [student[:name], student[:cohort]]
            csv_line = student_data.join(",")
            f.puts csv_line
            count += 1
        end
    end
    
    puts ""
    puts "#{count} student#{@students.count == 1 ? '' : 's'} saved to #{location}."
    puts ""
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

try_load_students
interactive_menu
