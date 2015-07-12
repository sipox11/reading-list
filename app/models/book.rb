class Book < ActiveRecord::Base
  
  scope :finished, -> { where.not(finished_on: nil) }
  scope :recent, -> { where('finished_on > ?', 1.year.ago) }
  scope :search, ->(keyword) { where(title: keyword) if keyword.present? }
  
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
end
