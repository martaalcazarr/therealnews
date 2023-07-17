class User < ApplicationRecord
  enum :role, [:normal_user, :author, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  after_create :assign_author_role

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments

  private

  def assign_author_role
    self.author! # Asignar el rol "author" al usuario
  end
end
