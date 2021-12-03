class Post
  attr_reader :published

  def publish!
    @published = true
  end
end

class Blog
  attr_reader :published_posts

  def initialize author
    @author = author
    @published_posts = []
  end

  def publish! post
    published_posts << post
    post.publish!
  end

  # Moar methods...
end

########################### -------------- Dummy --------------- #############################
# add author as an Object, author is not important to test publish method in this case
require 'minitest/autorun'

class BlogTest < Minitest::Test
  def test_publish_adds_post_to_published_posts
    author = Object.new
    blog = Blog.new(author)
    post = Post.new
    blog.publish!(post)
    assert_includes(blog.published_posts, post)
  end
end

# ************************************************************************************************** #

class Blog
  attr_reader :published_posts

  def initialize user
    @user = user
  end

  def publish! post
    published_posts << post if @user.author?
  end

  # Moar methods...
end

########################## ------------- Stub ----------------------- #########################

require 'minitest/autorun'

class BlogTest < Minitest::Test
  def test_publish
    post = Post.new
    user = User.new
    blog = Blog.new(user)
    user.stub :author?, true do
      blog.publish!(post)
      assert_includes blog.published_posts, post
    end
  end
end

# ******************************************************************************************************* #

class Blog
  attr_reader :published_posts

  def initialize user
    @user = user
  end

  def publish! post
    if @user.author?
      published_posts << post
      NotificationService.notify_subscribers(post)
    end
  end
end

########################### ----------------- SPY ----------------------- ##############################

# Works with a gem spy

class BlogTest < Minitest::Test
  def test_notification_is_sent_when_publishing
    notification_service_spy = Spy.on(NotificationService, :notify_subscribers)
    post = Post.new
    user = User.new
    blog = Blog.new(user)

    blog.publish!(post)

    assert notificaion_service_spy.has_been_called?
  end
end

# ******************************************************************************************************** #

class Blog
  attr_reader :published_posts

  def initialize user
    @user = user
  end

  def publish! post
    published_posts << post if @user.can?(:publish)
  end

  def delete post
    post.delete! if @user.can?(:delete)
  end

end

########################### ------------- Mock ----------------------- ##########################

class BlogTest < Minitest::Test
  def test_post_deletion
    user = Minitest::Mock.new
    post = Minitest::Mock.new
    blog = Blog.new(user)

    user.expect :can?, true
    post.expect :delete!, true

    blog.delete(post)

    user.verify
    post.verify
  end
end