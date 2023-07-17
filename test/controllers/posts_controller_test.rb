require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @post = posts(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:one)
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    sign_in users(:one)
    assert_difference("Post.count") do
    post posts_url, params: { post: { description: @post.description, image: @post.image, title: @post.title } }
    end
    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    user = users(:one) # Obtener un usuario existente de tus fixtures o crear uno en la prueba
    post = Post.create(title: "Title", description: "Description", user_id: user.id)
    get post_url(post)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get edit_post_url(@post)
    assert_response :success
  end

  test "should_update_post" do
    patch post_url(@post), params: { post: { title: "Nuevo título", description: "Nueva descripción" } }
    assert_redirected_to post_url(@post)
    @post.reload
    assert_equal "Nuevo título", @post.title
    assert_equal "Nueva descripción", @post.description
  end

  test "should destroy post" do
    sign_in users(:one)
    assert_difference("Post.count", -1) do
      delete post_url(@post)
    end
    assert_redirected_to posts_url
  end
end
