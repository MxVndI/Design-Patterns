class DatabaseConnection
  require 'pg'
  @client = nil

    private_class_method :new
  
    def self.instance
      @client = PG.connect(
        host: "localhost",
        user: "Vovs",
        password: "123",
        dbname: "student",
        port: 5432
      )
      @client
    end
    
end
  