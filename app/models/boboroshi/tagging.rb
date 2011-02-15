  class Boboroshi::Tagging < ActiveRecord::Base
    belongs_to :tag
    belongs_to :taggable, :polymorphic => true
    establish_connection(:bobo)
  end
