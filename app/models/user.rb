class User < ActiveRecord::Base
  has_many :posts

  before_create :set_member

  ROLES = %w[member moderator admin]
def role?(base_role)
  role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
end  

private

  def set_member
    self.role = 'member'
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


end
