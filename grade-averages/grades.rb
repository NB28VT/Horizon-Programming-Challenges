require 'json'

student_hash = File.read("students.json")

list = JSON.parse(student_hash)

list["students"].each do |student|
  name = student["name"]
  max_grade = student["grades"].max
  min_grade = student["grades"].min
  average = (student["grades"].inject { |sum, grade| sum + grade }) / 4
  printf("%-10s %6.2f %6d %6d\n", name, average, max_grade, min_grade)
end
