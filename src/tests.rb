require './Note_Application'
include Noteapp

RSpec.describe "NotesApplication" do
  context "instantiation of the notes application" do
    
    it "raises error for no author name" do
      expect {NotesApplication.new}.to raise_error ArgumentError
    end

    it 'raises error for input of digits' do
      expect {NotesApplication.new 4}.to raise_error "Input should be a string"
    end

    it 'raises error for char inputs' do
      expect {NotesApplication.new '@'}.to raise_error 'No Chars Allowed'
    end

    it 'raises error for empty input' do
      expect {NotesApplication.new ''}.to raise_error "Author name cannot be empty"
    end

    it 'raise error for nil input' do
      expect {NotesApplication.new nil}.to raise_error RuntimeError
    end

    it 'raises error for more than one inputs' do
      expect {NotesApplication.new 'a','be'}.to raise_error ArgumentError
    end

    
  end

  context 'checking for different instances' do 
      username1 = NotesApplication.new 'Username1'
      username2 = NotesApplication.new 'Username2'

      it 'should return Username1' do
        expect(username1.author).to eq 'Username1'
      end

      it 'should reutrn Username2' do
        expect(username2.author).to eq 'Username2'
      end


  end

  context 'checking if notes is an instance property' do
      moyosore = NotesApplication.new 'Username1'

      it 'returns the notes list' do
        expect(moyosore.list).to eq []
      end

  end

  context "Checking if method" do
    moyosore = NotesApplication.new 'Username1'

    moyosore.create "My first note"
    moyosore.create 'My second note'
    moyosore.create 'My third note'

    it 'returns the authors name' do 
      expect(moyosore.author).to eq 'Username1'
    end

    it 'returns array or notes' do
      expect(moyosore.get 0).to eq 'My first note'
    end

    it 'returns the last note in notes' do
      expect(moyosore.get -1).to eq 'My third note'
    end

    it 'returns the second note in notes' do
      expect(moyosore.get 1).to eq 'My second note'
    end

    it 'raises error if the get is passed a string' do
      expect {moyosore.get '1'}.to raise_error 'Note Id must be an Integer'
    end

    it 'raises error if edit parameters are not equal' do
      expect {moyosore.edit 1}.to raise_error ArgumentError
    end

    it 'raises error if first parameter is not Integer' do 
      expect {moyosore.edit "1",'This is huge'}.to raise_error 'Note Id must be an Integer'
    end

    it 'should edit the index' do
      expect {moyosore.edit 0,'This is huge'}.to change {moyosore.get 0}. from("My first note").to('This is huge')
    end

    it 'should have edited the notes' do
      expect(moyosore.notes_list).to eq ['This is huge','My second note','My third note']
    end


    it 'should delete method to raise error if note_id is a string' do
      expect {moyosore.delete "0"}.to raise_error "Note Id must be an Integer"
    end

    it 'should delete index 0' do
      expect {moyosore.delete 0}.to change {moyosore.notes_list.length}.from(3).to(2)
    end


    it 'should return This is the second note for index 0' do
      expect(moyosore.get 0).to eq 'My second note'
    end

    it 'should delete index 0' do
      expect(moyosore.delete 0).to eq 'My second note'
    end

    it 'should return search results with for the' do
      expect(moyosore.search('My')[0]).to eq "Note ID: 0\n My third note\n\nBy Author Username1\n"
    end

    it 'should return search not found' do 
      expect(moyosore.search 'asdfjkl').to eq "No notes found for the seacrh: asdfjkl"
    end
    

  end

  context "Checking note inputs" do

    moyosore = NotesApplication.new 'Username1'

    it 'raises error if input is an Integer' do
      expect {moyosore.create 4}.to raise_error 'Input should be a string'
    end

    it 'raises error if input is an array' do
      expect {moyosore.create []}.to raise_error 'Input should be a string'
    end

    it 'should raise an error if the input is not a string for search' do
      expect {moyosore.search 4}.to raise_error 'Input should be a string'
    end


  end


end
