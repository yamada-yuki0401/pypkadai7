class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
 has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
 has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
 has_many :following_user, through: :follower, source: :followed
 has_many :follower_user, through: :followed, source: :follower
  
  attachment :profile_image
  validates :name, presence: true
  validates :name,    length: { minimum: 2 }
  validates :name,    length: { maximum: 20 }
  validates :name, uniqueness: true
  validates :introduction,    length: { maximum: 50 }
  
  def follow(user_id)
  follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
  follower.find_by(followed_id: user_id).destroy
  end
  
  def following?(user)
    following_user.include?(user)
  end
  
    def self.search(search,word)
      if search == "forward_match"
        @user = User.where("name LIKE?","#{word}%")
      elsif search == "backward_match"
        @user = User.where("name LIKE?","%#{word}")
      elsif search == "perfect_match"
        @user = User.where("#{word}")
      elsif search == "partial_match"
        @user = User.where("name LIKE?","%#{word}%")
      else
        @user = User.all
      end
    end
    include JpPrefecture
      jp_prefecture :prefecture_code
      
      def prefecture_name
        JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
      end
      
      def prefecture_name=(prefecture_name)
        self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
      end
end
