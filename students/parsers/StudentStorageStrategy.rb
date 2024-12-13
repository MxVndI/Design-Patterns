class StudentStorageStrategy
    def load_students(file_path)
      raise NotImplementedError, 'This method should be overridden in subclasses'
    end
  
    def save_students(file_path, students)
      raise NotImplementedError, 'This method should be overridden in subclasses'
    end
  end