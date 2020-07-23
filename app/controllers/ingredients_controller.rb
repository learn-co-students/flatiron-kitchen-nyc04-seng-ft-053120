class IngredientsController < ApplicationController
    before_action :set_ingredient, only: [:new, :show, :edit, :update]

    def show
    end

    def new
    end

    def create
        @ingredient = Ingredient.new(ingredient_params)
        
        if @ingredient.save
            redirect_to @ingredient
        else
            render :new    
        end
    end

    def edit
    end

    def update
        @ingredient.assign_attributes(ingredient_params)
        if @ingredient.save
            redirect_to @ingredient
        else
            render :edit
        end
    end

    private

    def set_ingredient
        params[:id].nil? ? (@ingredient = Ingredient.new()) : (@ingredient = Ingredient.find(params[:id]))
    end

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end


end
