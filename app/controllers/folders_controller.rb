class FoldersController < ApplicationController
  def show
    @folder = Folder.find(params[:id])
    @notes = @folder.notes
  end
end
