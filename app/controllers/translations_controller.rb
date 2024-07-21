class TranslationsController < ApplicationController
  def new
    @translation = Translation.new
  end

  def create
    @translation = Translation.new(translation_params)
    if @translation.save
      @translation.update(translated_text: translate(@translation.original_text, @translation.source_lang, @translation.target_lang))
      redirect_to @translation
    else
      render :new
    end
  end

  def show
    @translation = Translation.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Tradução não encontrada."
    redirect_to new_translation_path
  end

  private

  def translation_params
    params.require(:translation).permit(:original_text, :source_lang, :target_lang)
  end

  def translate(text, source_lang, target_lang)
    api_key = ENV['DEEPL_API_KEY']
    url = "https://api-free.deepl.com/v2/translate"
    response = RestClient.post(url, {
      text: text,
      source_lang: source_lang,
      target_lang: target_lang,
      auth_key: api_key
    })
    JSON.parse(response.body)['translations'].first['text']
  rescue RestClient::ExceptionWithResponse => e
    Rails.logger.error "Translation API request failed: #{e.response}"
    "Erro ao traduzir o texto."
  end
end

