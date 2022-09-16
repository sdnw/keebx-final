class ItemsController < ApplicationController
    def index 
        render json: Item.all 
    end
    
    def show
        item = Item.find_by(id: params[:id])
        if item
            render json: item
        else
            render_not_found_response
        end
    end
    
    def create 
        item = Item.new(item_params)
        if item.save 
            render json: item, status: :created
        else
            render json: {errors: item.errors}, status: :unprocessable_entity
        end
    end 
    
    def update
        item = Item.find_by(id: params[:id])
        if item
            item.update(item_params)
            render json: item
        else
            render_not_found_response
        end
    end

    def destroy
        item = Item.find(params[:id])
        item.destroy
        head :no_content
    end 

    def purchase 
        item = Item.find(params[:item_id])
        user = User.find(session[:user_id])
        qp = params[:quantity].to_i

        updated_item = item.purchase(qp, user)

        if updated_item.save
            HelloMailer.purchase(user, item).deliver     

            render json: updated_item
        else 
            render json: { error: 'Bad' }, status: :unprocessable_entity
        end
    end

    def my_items 
        uirs = UserItemRelationship.where(user_id: session[:user_id])
        items = uirs.map{|uir| uir.item}
        
        if items
            render json: items
        else 
            render_user_not_found_response
        end
    end

    private
    def item_params
        params.permit(:name, :price, :image, :description, :quantity)
    end
        

    def render_not_found_response
        render json: { error: 'Item not found' }, status: :not_found
    end 

    def render_user_not_found_response
        render json: { error: 'User not found' }, status: :not_found
    end 

end
