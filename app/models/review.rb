class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  
  QUALITY_OPTIONS = ["Bad", "Regular", "Good"] #Arreglo Constante
  DEFAULT_QUALITY = QUALITY_OPTIONS[1]	#Cte. para tener un valor
  
  validates_presence_of :review
  validates_length_of :review, :maximum => 400
  
  before_save :defaultQuality
  
  def defaultQuality
    self.quality = DEFAULT_QUALITY if self.quality.blank?
  end
end