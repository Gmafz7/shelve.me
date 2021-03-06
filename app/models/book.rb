class Book < ActiveRecord::Base
  
  has_many :reviews
  
  attr_accessible :title, :author, :description
  
  before_validation :validarAutor, :validarTitulo
  
  validates_presence_of :author, :title
  
  validates_uniqueness_of :title, :scope => :author, :message=> "Probando 1, 2, 3"
  
  def validarAutor
    if self.author.blank?
      return
    else
      arr = self.author.split(' ')
      arr.each { |t| t.capitalize! }
      mayus = arr.join(' ')
      self.author = mayus
    end
  end
  
  def validarTitulo
    if self.title.blank?
      return
    else
      arr = self.title.split(' ')
      arr.each { |t| t.capitalize! }
      mayus = arr.join(' ')
      self.title = mayus
    end
  end
  
  def self.search(search)
    if search
      where( 'name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
end
