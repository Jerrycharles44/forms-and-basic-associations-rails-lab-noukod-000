class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def genre_name=(name)
     self.genre = Genre.find_or_create_by(name: name)
  end

  def note_contents=(contents)
    contents.each do |content|
      self.notes << Note.find_or_create_by(content: content) unless content.empty?
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end
end