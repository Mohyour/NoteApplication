require_relative "note_application"
include Noteapp
  puts "Welcome to My Notes application."
  puts "Enter you name"
  player_name = gets.chomp
  author = NotesApplication.new(player_name)
    loop do
      puts "What do you want to do #{player_name}?"
      puts "Enter\n c to create,\n l to list,\n g to get notes,\n s to search for a note,\n d to delete a note\n e to edit a note,\n q to quit "
      options = gets.chomp

        case options.downcase
        when "c"
          puts "Enter your notes"
          note = gets.chomp
          author.create(note)
          puts "Note successfully created"
          puts " "
        when "l"
          puts author.list
          puts " "
        when "g"
          puts "Enter the note Id you want to get"
          id = gets.chomp
          author.get(id.to_i)
          puts " "
        when "s"
          puts "Enter the string you want to search for"
          string = gets.chomp
          puts author.search(string)
          " "
        when "d"
          puts "Enter the notes id you would like to delete"
          id = gets.chomp
          author.delete(id.to_i)
          puts "Note succesfully deleted"
          puts " "
        when "e"
          puts "Enter the id of the note you want to edit"
          id = gets.chomp
          puts "Enter the new content"
          string = gets.chomp
          author.edit(id.to_i,string)
          puts "Note succesfully deleted"
          puts " "
        when "q"
          puts "Thank you #{player_name}!"
          system(exit)
        end
    end
