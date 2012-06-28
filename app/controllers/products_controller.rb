class ProductsController < ApplicationController

	def index
  	respond_to do |format|
	    format.html
	    format.json { render json: ProductsDatatable.new(view_context) }
	  end
	end
	
	def update
    product_to_modify = Product.find(params[:id])
    product_columns= Product.columns.map {|c| c.name }
    modified_column = product_columns[params[:columnId].to_i]
    new_value = params[:value]

    respond_to do |format|
      if product_to_modify.update_attribute(modified_column, new_value)
        format.js {render :json => new_value}
      else
        format.js {render :json => "Update failed!"}
      end
    end
  end  

end