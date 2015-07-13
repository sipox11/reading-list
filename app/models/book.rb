class Book < ActiveRecord::Base
  has_many :book_genres
  has_many :genres, through: :book_genres
  
  scope :finished, -> { where.not(finished_on: nil) }
  scope :recent, -> { where('finished_on > ?', 1.year.ago) }
  scope :search, ->(keyword) { where('keywords LIKE ?', "%#{keyword.downcase}%") if keyword.present? }
  scope :filter_by, ->(genre_name) { 
          joins(:genres).where('genres.name = ?', genre_name) if genre_name.present?} 
  
  before_save :set_keywords
  
  # def self.recent
  #   where('finished_on > ?', 1.year.ago)
  # end
  
  # def self.search(keyword)
  #   if keyword.present?
  #     where(title: keyword) 
  #   else
  #     all
  #   end
  # end
  
  def finished?
    finished_on.present?
  end
  
  protected
    def set_keywords
      self.keywords = [title, author, description].map(&:downcase).join(' ')
    end
end
