class CommentsController < ApplicationController
	before_action :authenticate_user!
  	load_and_authorize_resource
  	before_action :set_project, only: %i[new create ]


  # GET /projects/new
  def new
    @comment = @project.comments.build
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @comment = @project.comments.build(comment_params.merge(user_id: current_user&.id))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to projects_path, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:message, :project_id, :user_id)
    end
end
