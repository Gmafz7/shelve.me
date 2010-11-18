class Book < ActiveRecord::Base
  
  attr_accessible :title, :author, :description
  validates_presence_of :author, :title
  validates_uniqueness_of :author, :title
  before_save :validarAutor, :validarTitulo
  
  def validarAutor
    arr = self.author.split(' ')
    arr.each { |t| t.capitalize! }
    mayus = arr.join(' ')
    self.author = mayus
  end
  
  def validarTitulo
    arr = self.title.split(' ')
    arr.each { |t| t.capitalize! }
    mayus = arr.join(' ')
    self.title = mayus
  end
  
end
