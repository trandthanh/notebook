class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.folder = Folder.find(params[:folder_id])

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

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
