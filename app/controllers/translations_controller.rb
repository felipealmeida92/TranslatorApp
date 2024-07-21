class TranslationsController < ApplicationController
  def new
  end

  def create
    original_text = params[:translation][:original_text]
    source_lang = params[:translation][:source_lang]
    target_lang = params[:translation][:target_lang]

    translated_text = translate(original_text, source_lang, target_lang)

    @translation = Translation.create(
      original_text: original_text,
      translated_text: translated_text,
      source_lang: source_lang,
      target_lang: target_lang,
      translated_at: Time.now
    )

    if @translation.save
      redirect_to translation_path(@translation)
    else
      render :new
    end
  end

  def show
    @translation = Translation.find(params[:id])
  end

  private

  def translate(text, source_lang, target_lang)
    response = RestClient.post "https://libretranslate.de/translate", {
      q: text,
      source: source_lang,
      target: target_lang
    }.to_json, { content_type: :json, accept: :json }
    result = JSON.parse(response.body)
    result['translatedText']
  end
end

