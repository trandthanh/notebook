class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @folder = Folder.find(params[:folder_id])
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to folder_path(@note.folder), notice: "Note was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to folder_path(@note.folder), notice: "Note was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to folder_path(@note.folder), notice: "Note was successfully destroyed."
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content, :folder_id)
  end
end
