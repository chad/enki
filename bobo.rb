%w(comment
comment_activity
delete_comment_undo
delete_page_undo
delete_post_undo
page
post
stats
tag
tagging
undo_item
).each do |f|
  require f
end
Post.delete_all
Comment.delete_all
Tag.delete_all
Tagging.delete_all
Boboroshi::Article.connection.execute("update contents set type = 'Boboroshi::Article' where type = 'Article'")
Boboroshi::Article.connection.execute("update contents set type = 'Boboroshi::Comment' where type = 'Comment'")
Boboroshi::Article.all.each do |article|
  tags = article.tags
  post = Post.create(
    :title => article.title, 
    :body => article.body, 
    :body_html => article.body_html,
    :published_at => article.published_at || article.created_at,
    :tag_list => tags.map(&:name)
  )
  article.comments.each do |comment|
    post.comments.create(:author_url => comment.author_url || "http://cnn.com", 
                     :author => comment.author, 
                     :author_email => comment.author_email,
                     :created_at => comment.created_at,
                     :body => comment.body,
                     :body_html => comment.body_html)
  end
end
