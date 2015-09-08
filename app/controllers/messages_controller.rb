class MessagesController < ApplicationController

	def index
		@messages = Message.all.order(created_at DESC)
	end

	def new
		@message = Message.new
	end

	def create
		@message = Message.new(message_params)
		if @message.save
			redirect_to '/', notice: "Brawo, wiadomość dodana!"
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @message.update(message_params)
			redirect_to '/', notice: "Wiadomość zmieniona!"
		else
			render 'edit'
		end
	end

	def destroy
		@message.destroy
		redirect_to root_path, notice: "Wiadomość usunięta!"
	end

	private

	def message_params
		params.require(:message).permit(:title, :content)
	end



end
