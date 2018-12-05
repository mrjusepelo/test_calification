# README
rails g model teacher name
rails g model student name
rails g model course name teacher:references
rails g model asignature name
rails g model student_course course:references student:references
rails g model asignature_course course:references asignature:references
rails g model asignature_student student:references asignature:references
rails g migration addFieldValueToAsignatureStudent value:float
