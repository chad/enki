  class Boboroshi::Content < ActiveRecord::Base
    has_many :tags, :through => :taggings
    has_many :taggings, :as => :taggable
    establish_connection(:bobo)
  end
