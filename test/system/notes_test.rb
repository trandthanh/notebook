require "application_system_test_case"

class NotesTest < ApplicationSystemTestCase
  setup do
    @note = notes(:first_note)
  end

  test "Creating a new note" do
    visit notebook_path(@note.notebook)
    assert_selector "h1", text: @note.notebook.name

    click_on "New note"
    assert_selector "h1", text: "New note"

    fill_in "Title", with: "Capybara quote"
    click_on "Create note"

    assert_selector "h1", text: @note.notebook.name
    assert_text "Capybara quotes"
  end

  test "Showing a note" do
    visit notebook_path(@note.notebook)
    click_link @note.title

    assert_selector "h1", text: @note.title
  end

  test "Updating a note" do
    visit notebook_path(@note.notebook)
    assert_selector "h1", text: @note.notebook.name

    click_on "Edit", match: :first_note
    assert_selector "h1", text: "Edit note"

    fill_in "Title", with: "Update note"
    click_on "Update note"

    assert_selector "h1", text: @note.notebook.name
    assert_text "Updated note"
  end

  test "Destroying a note" do
    visit notebook_path(@note.notebook)
    assert_text @note.title

    click_on "Delete", match: :first_note
    assert_no_text @note.title
  end
end
