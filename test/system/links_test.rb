require "application_system_test_case"

class LinksTest < ApplicationSystemTestCase
  setup do
    @link = links(:one)
  end

  test "visiting the index" do
    visit links_url
    assert_selector "h1", text: "Links"
  end

  test "should create link" do
    visit links_url
    click_on "New link"

    check "Active" if @link.active
    fill_in "Created at", with: @link.created_at
    fill_in "Expiration date", with: @link.expiration_date
    fill_in "Password", with: @link.password
    fill_in "Public url", with: @link.public_url
    fill_in "Slug", with: @link.slug
    fill_in "Type", with: @link.type
    click_on "Create Link"

    assert_text "Link was successfully created"
    click_on "Back"
  end

  test "should update Link" do
    visit link_url(@link)
    click_on "Edit this link", match: :first

    check "Active" if @link.active
    fill_in "Created at", with: @link.created_at
    fill_in "Expiration date", with: @link.expiration_date
    fill_in "Password", with: @link.password
    fill_in "Public url", with: @link.public_url
    fill_in "Slug", with: @link.slug
    fill_in "Type", with: @link.type
    click_on "Update Link"

    assert_text "Link was successfully updated"
    click_on "Back"
  end

  test "should destroy Link" do
    visit link_url(@link)
    click_on "Destroy this link", match: :first

    assert_text "Link was successfully destroyed"
  end
end
