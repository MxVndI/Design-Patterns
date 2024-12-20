require_relative '../db/DB_connection.rb'
require_relative '../data/data_list_student_short.rb'
require_relative '../models/student_short.rb'

class StudentsListDB
  def initialize
    @client = DatabaseConnection.instance
  end

  def find_student_by_id(id)
    result = @client.query("SELECT * FROM student WHERE id = $1", [id]).first
    Student.new(**result.transform_keys(&:to_sym)) if result
  end

  def get_k_n_student_short_list(k, n)
    offset = (k - 1) * n
    query = "SELECT * FROM student LIMIT $1 OFFSET $2"
    results = @client.query(query, [n, offset]).map do |row|
      StudentShort.new(Student.new(**row.transform_keys(&:to_sym)))
    end
    DataListStudentShort.new(results)
  end

  def add_student(student)
    query = <<-SQL
      INSERT INTO student (name, surname, lastname, birth_date, telegram, mail, phone, git)
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
    SQL
    @client.query(query, [
      student.name,
      student.surname,
      student.lastname,
      student.birth_date,
      student.telegram,
      student.mail,
      student.phone,
      student.git
    ])
    @client.last_id
  end

  def update_student_by_id(id, updated_student)
    query = <<-SQL
      UPDATE student
      SET name=$1, surname=$2, lastname=$3,
          birth_date=$4, telegram=$5, mail=$6,
          phone=$7, git=$8
      WHERE id=$9
    SQL
    @client.query(query, [
      updated_student.name,
      updated_student.surname,
      updated_student.lastname,
      updated_student.birth_date,
      updated_student.telegram,
      updated_student.mail,
      updated_student.phone,
      updated_student.git,
      id
    ])
  end

  def delete_student(id)
    @client.query("DELETE FROM student WHERE id = $1", [id])
  end

  def student_count
    @client.query('SELECT COUNT(*) AS count FROM student').first['count'].to_i
  end
end
