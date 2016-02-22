module Noteapp
  class NotesApplication
    attr_reader :author, :notes_list

      def initialize(author)
        errorHandler author
        @author = author
        @notes_list = []
      end

      def create(note_content)
        checkNoteInput note_content
        @notes_list << note_content
      end

      def list
        @notes_list.collect { |x| "Note ID: #{@notes_list.index(x)}\n #{x}\n\nBy Author #{@author}\n" }
      end

      def get(note_id)
        checkNoteId note_id
        @notes_list[note_id]
      end

      def search(search_text)
        checkNoteInput search_text
        result = {}
        @notes_list.each_with_index do |text, index|
          if !(text =~ /(#{search_text})/).nil?
            result[index] = text
            end
          end

        puts "Showing results for search ‘ [ < #{search_text} > ] ’"
        if !result.empty?
            result.collect {|index, text| "Note ID: #{index}\n #{text}\n\nBy Author #{@author}\n"}
        else
            return "No notes found for the seacrh: #{search_text}"
        end

      end

      def delete(note_id)
          checkNoteId note_id
            
          @notes_list.delete_at note_id
      end
        
      def edit(note_id,note_content)
          checkNoteId note_id
          checkNoteInput note_content
          checkifNoteExists note_id

           
          @notes_list[note_id] = note_content
      end

  private 

      def checkifNoteExists note_id
          raise "Note does not exist" if @notes_list[note_id].nil?
            
      end

      def checkNoteInput note
          raise "Input should be a string" if !note.is_a? String
            
      end

        
      def checkNoteId note_id
          raise "Note Id must be an Integer" if !note_id.is_a? Integer
            
      end


      def errorHandler author
          raise "Input should be a string" if !author.is_a? String
          raise "No Chars Allowed" if author.match(/[~!@#$%^&*(){}|:<>]+/)
          raise "Author name cannot be empty" if author.empty?
          raise RuntimeError if author.nil?
            
      end

  end
end