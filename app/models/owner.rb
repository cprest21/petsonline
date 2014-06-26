class Owner < ActiveRecord::Base
  belongs_to :address
  belongs_to :user
  has_many :pets

  has_attached_file :avatar, :styles => { :medium => "150x150", :thumb => '20x20'}, :default_url => "/images/:style/missing.png "
  validates_attachment :avatar, :content_type => { :content_type => /\Aimage\/.*\Z/ },
  :size => { :in => 0..1024.kilobytes }

  def name_with_lastname
    "#{name} #{lastname}"
  end

end
