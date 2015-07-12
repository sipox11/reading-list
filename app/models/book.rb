class Book < ActiveRecord::Base
  
  scope :finished, -> { where.not(finished_on: nil) }
  scope :recent, -> { where('finished_on > ?', 1.year.ago) }
  scope :search, ->(keyword) { where('keywords LIKE ?', "%#{keyword.downcase}%")}
  
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
