student_count = 11

students = [
"Dr. Hannibal Lector", 
"Darth Vader", 
"Nurse Ratched", 
"Michael Corleone",
"Alex DeLarge",
"The Wicked With of the West",
"Terminator", "Freddy Krueger", 
"The Joker", 
"Joffrey Baratheon", 
"Norman Bates"
]

#print list of students
puts "The students of Villains Academy"
puts "---------------"

students.each do |student|
    puts student
end


#print total number of students
puts "Overall, we have #{students.count} great students"