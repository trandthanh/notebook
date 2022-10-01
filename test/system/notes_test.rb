require "application_system_test_case"

class NotesTest < ApplicationSystemTestCase
  setup do
    @note = notes(:first_note)
  end

  test "Creating a new note" do
    visit folder_path(@note.folder)
    assert_selector "h1", text: @note.folder.name

    click_on "New note"
    assert_selector "h1", text: "New note"

    fill_in "Title", with: "Capybara quotes"
    click_on "Create Note"

    assert_selector "h1", text: @note.folder.name
    assert_text "Capybara quotes"
  end

  test "Showing a note" do
    visit folder_path(@note.folder)
    click_link @note.title

    assert_selector "h1", text: @note.title
  end

  test "Updating a note" do
    visit folder_path(@note.folder)
    assert_selector "h1", text: @note.folder.name

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit note"

    fill_in "Title", with: "Updated note"
    click_on "Update Note"

    assert_selector "h1", text: @note.folder.name
    assert_text "Updated note"
  end

  test "Destroying a note" do
    visit folder_path(@note.folder)
    assert_text @note.title

    click_on "Delete", match: :first
    assert_no_text @note.title
  end
end
