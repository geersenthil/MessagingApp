class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def create
    @room = Room.find_by(message_params[:room_id])
    @message = Message.create user: current_user,
                                       room: @room,
                              chattext: message_params[:chattext]
  end

  protected
  def set_message
    @message = Message.find(params[:id])
  end
  def message_params
    params.require(:message).permit(:chattext, :room_id)
  end
=begin
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  def index
    @messages = Message.all
  end

  # GET /messages/1
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
    @recipient = User.find(message_params[:recipient_id])
    @message.user_id = message_params[:recipient_id]
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  def create
    @recipient = User.find(message_params[:recipient_id])
    @message = @recipient.messages.build(message_params.except(:recipient_id))
    @message.sender_id = current_user.id


    if @message.save
      redirect_to @message, notice: 'Message was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      redirect_to @message, notice: 'Message was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
    redirect_to messages_url, notice: 'Message was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:chattext, :recipient_id)
    end
=end
end
