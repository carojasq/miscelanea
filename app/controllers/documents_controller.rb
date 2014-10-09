class DocumentsController < ApplicationController
	before_action :authenticate_admin!, only: [:new,:create, :edit, :update, :destroy]

  def new
  	@document = Document.new
  end

  def edit
  	@document = Document.find(params[:id])
  end

  def update
  	@document = Document.find(params[:id])
  	if @document.update(document_params)
  		@mensaje = "Documento actualizado exitosamente"
  		redirect_to documents_path
  	else 
  		@mensaje = "Introduzca los datos del Documento a actualizar"
  		render 'edit'
  	end
  end

  def destroy
  	@document = Document.find(params[:id])
  	if @document.destroy
  	 @mensaje = "Documento eliminado"
  	 redirect_to documents_path
    end
  end

  def show
    @document = Document.find(params[:id]) # Find article by id
  end

  def index 
  	@documents = Document.all
    puts "HERE ARE THE ATTRIBUTES"
    puts @documents[0].attributes
    puts @documents[0].class
  end

  def create
    @document = Document.new(document_params)
  	if @document.save 
  		@mensaje = "Documento añadido con éxito"
  		redirect_to documents_path
  	else
  		@mensaje = "No se pudo almacenar categoría"
  		render 'new'
  	end
  end

  private
  def document_params
     params.require(:document).permit(:name, :document_file, :valid_until)
  end

end

