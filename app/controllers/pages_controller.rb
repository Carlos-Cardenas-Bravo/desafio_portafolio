require 'csv'

class PagesController < ApplicationController
  def home
  end

  def projects
  end

  def contact
  end

  def contact
    if request.post?
      nombre = params[:nombre]
      asunto = params[:asunto]
      mensaje = params[:mensaje]

      # Guardar en un archivo CSV
      CSV.open(Rails.root.join('public', 'contactos.csv'), 'a+') do |csv|
        csv << [nombre, asunto, mensaje]
      end

      flash[:notice] = "Tu mensaje ha sido enviado"
      redirect_to contacto_path
    end
  end
end
