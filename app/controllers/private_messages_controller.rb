class PrivateMessagesController < ApplicationController
  before_action :set_private_message, only: [:show, :edit, :update, :destroy]

  # GET /private_messages
  def index
    @private_messages_sent = PrivateMessage.find_by_sql(["select * from private_messages
            where private_messages.sender_id =?  ",  current_user.id])
  end

  # GET /private_messages/1
  def show
  end

  # GET /private_messages/new
  def new
    @private_message = PrivateMessage.new
    @recipient = User.find(private_message_params[:recipient_id])
    @private_message.user_id = private_message_params[:recipient_id]
    @private_messages_sent = PrivateMessage.find_by_sql(["select * from private_messages
            where private_messages.sender_id =? AND private_messages.user_id =? UNION select * from private_messages
            where private_messages.sender_id =? AND private_messages.user_id =? ORDER BY id ",  current_user.id,@recipient.id,  @recipient.id,  current_user.id])

  end

  # GET /private_messages/1/edit
  def edit
  end

  # POST /private_messages
  def create
    @recipient = User.find(private_message_params[:recipient_id])
    @private_message = @recipient.private_messages.build(private_message_params.except(:recipient_id))
    @private_message.sender_id = current_user.id

    if @private_message.save
      redirect_to new_private_message_path(:private_message =>{:recipient_id => @recipient.id}), notice: 'Private message was successfully created.'
    else
      render :new
    end

  end

  # PATCH/PUT /private_messages/1
  def update
    if @private_message.update(private_message_params)
      redirect_to @private_message, notice: 'Private message was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /private_messages/1
  def destroy
    @private_message.destroy
    redirect_to private_messages_url, notice: 'Private message was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_private_message
      @private_message = PrivateMessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def private_message_params
      params.require(:private_message).permit(:directmessage, :recipient_id)
    end
end
