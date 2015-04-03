class PokemonsController < ApplicationController 
	def capture
		pokemon = Pokemon.find(params[:id])
		pokemon.trainer_id = current_trainer.id 
		pokemon.save 
		redirect_to root_url
	end

	def update
		capture
	end 

	def damage
		@p = Pokemon.find(params[:id])
		if @p.health - 10 <= 0 
			@p.destroy
			redirect_to trainer_path(@p.trainer) 
		else 
			@p.health = @p.health - 10
			@p.save
			redirect_to trainer_path(@p.trainer)
		end
	end

	def create
		name = params["pokemon"]["name"]
		@p = Pokemon.new name: name, trainer_id: current_trainer.id, health: 100, level: 1
		if @p.save 
			redirect_to trainer_path(@p.trainer)
		else
			flash[:error] = @p.errors.full_messages.to_sentence
			redirect_to trainer_path(@p.trainer)
		end
	end
end