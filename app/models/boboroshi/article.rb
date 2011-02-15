class Boboroshi::Article < Boboroshi::Content
  has_many :comments, :class_name => "Boboroshi::Comment"
end
