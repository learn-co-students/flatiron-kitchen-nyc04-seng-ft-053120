class RecipesController < ApplicationController
    before_action :set_recipe

    def index
        @recipes = Recipe.all
    end

    def show
    end

    def new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to @recipe
        else
            render :new
        end
    end

    def edit
    end

    def update
        @recipe.assign_attributes(recipe_params)
        if @recipe.save
            redirect_to @recipe
        else
            render :edit
        end
    end


    private

    def set_recipe
        params[:id].nil? ? (@recipe = Recipe.new()) : (@recipe = Recipe.find(params[:id]))
    end

    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids: [])
    end
end
