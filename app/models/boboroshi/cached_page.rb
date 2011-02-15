  class Boboroshi::CachedPage < ActiveRecord::Base
    establish_connection(:bobo)
  end
