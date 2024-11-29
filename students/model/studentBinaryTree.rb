require_relative "student.rb"
  
  class StudentBinaryTree
    include Enumerable

    attr_reader :root

    def initialize
        @root = nil
      end
  
    class Node
      attr_accessor :data, :left, :right
  
      def initialize(data)
        @data = data
        @left = nil
        @right = nil
      end
    end
  
    def add(data)
      @root = add_recursive(@root, data)
    end
  
    def add_recursive(node, data)
        return Node.new(data) if node.nil?
        if data < node.data
          node.left = add_recursive(node.left, data)
        else
          node.right = add_recursive(node.right, data)
        end
        return node
      end

    
    def each(&block)
      DFS(@root, &block)
    end
  
    def DFS(node, &block)
      return if node.nil?
      DFS(node.left, &block)
      yield node.data
      DFS(node.right, &block)
    end
  end
    
    student1 = Student.new(id: 1, name: 'John', surname: 'Doe', lastname: 'Smith', birth_date: '1990-01-15', phone: '89182876876', git: 'johnsmith123', telegram: '@johnsmith', mail: 'john.smith@example.com'),
    student2 = Student.new(id: 2, name: 'Jane', surname: 'Doe', lastname: 'Johnson', birth_date: '1985-06-22', phone: '89182876876', git: 'janedoe1985', telegram: '@janedoe85', mail: 'jane.johnson@example.com'),
    student3 = Student.new(id: 3, name: 'Bob', surname: 'Brown', lastname: 'Wilson', birth_date: '1992-03-12', phone: '89182876876', git: 'bobwilson92', telegram: '@bobwilson92', mail: 'bob.wilson@example.com'),
    student4 = Student.new(id: 4, name: 'Alice', surname: 'Johnson', lastname: 'Brown', birth_date: '1988-09-01', phone: '89182876876', git: 'alicebrown88', telegram: '@alicebrown88', mail: 'alice.brown@example.com'),
    student5 = Student.new(id: 5, name: 'Charlie', surname: 'Smith', lastname: 'Johnson', birth_date: '1995-07-25', phone: '89182876876', git: 'charliejohnson95', telegram: '@charliejohnson95', mail: 'charlie.johnson@example.com')

  
  tree = StudentBinaryTree.new
  tree.add(student1)
  tree.add(student2)
  tree.add(student3)
  tree.add(student4)
  tree.add(student5)

  tree.each { |student| puts student }
  
  