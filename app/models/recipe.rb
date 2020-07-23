class Recipe < ApplicationRecord
    has_many :recipe_ingredients, dependent: :destroy
    has_many :ingredients, through: :recipe_ingredients
    validates :name, presence: true

    def ingredient_ids=(ids)
        self.ingredients.pluck(:id).each do |id|
            if !ids.include?(id.to_s)
                RecipeIngredient.find_by(recipe_id: self.id, ingredient_id: id).destroy
            else
                ids.delete(id.to_s)
            end
        end

        ids.each do |id|
            self.ingredients << Ingredient.find(id) if !id.blank?
        end

    end

end
