class User < ActiveRecord::Base
  include Pageflow::UserMixin

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :zxcvbnable

  # Add words speficic to us zxcvnable
  def weak_words
    ['scrolly', 'scrollytelling', self.name]
  end
end
