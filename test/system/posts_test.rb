require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "Posts"
  end

  test "creating a Post" do
    visit posts_url
    click_on "New Post"

    fill_in "Category", with: @post.category_id
    fill_in "Description", with: @post.description
    fill_in "Detail media", with: @post.detail_media
    check "Image detail media" if @post.image_detail_media
    fill_in "Posted by", with: @post.posted_by
    fill_in "Source", with: @post.source
    fill_in "Story image", with: @post.story_image
    fill_in "Title", with: @post.title
    click_on "Create Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "updating a Post" do
    visit posts_url
    click_on "Edit", match: :first

    fill_in "Category", with: @post.category_id
    fill_in "Description", with: @post.description
    fill_in "Detail media", with: @post.detail_media
    check "Image detail media" if @post.image_detail_media
    fill_in "Posted by", with: @post.posted_by
    fill_in "Source", with: @post.source
    fill_in "Story image", with: @post.story_image
    fill_in "Title", with: @post.title
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "destroying a Post" do
    visit posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post was successfully destroyed"
  end
end
