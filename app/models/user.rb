class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :title, :position, :year, :major,
                  :site, :projects, :experience, :expertise, :password,
                  :password_confirmation, :remember_me

    def image_path
    file_name = self.name.downcase.split.join('_')
    return "/images/members/" + file_name + ".jpg"
  end
end
