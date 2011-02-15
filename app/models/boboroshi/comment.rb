class Boboroshi::Comment < Boboroshi::Content
  belongs_to :article, :class_name => "Boboroshi::Article"
end
