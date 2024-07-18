require "google/cloud/translate/v2"

class TranslationsController < ApplicationController
  def new
    @translation = Translation.new
  end

  def create
    @translation = Translation.new(translation_params)
    translated_text = translate(@translation.original_text, @translation.source_lang, @translation.target_lang)
    @translation.translated_text = translated_text

    if @translation.save
      save_translation_to_file(@translation)
      redirect_to @translation, notice: 'Translation was successfully created.'
    else
      render :new
    end
  end

  def show
    @translation = Translation.find(params[:id])
  end

  private

  def translation_params
    params.require(:translation).permit(:original_text, :source_lang, :target_lang)
  end

  def translate(text, source_lang, target_lang)
    translate = Google::Cloud::Translate::V2.new(key: ENV['GOOGLE_CLOUD_API_KEY'])
    response = translate.translate text, from: source_lang, to: target_lang
    response.text
  end

  def save_translation_to_file(translation)
    timestamp = Time.now.strftime("%d-%m-%y_%H:%M")
    filename = "translation_#{timestamp}.txt"
    File.open(filename, 'w') do |file|
      file.puts "Original Text: #{translation.original_text}"
      file.puts "Translated Text: #{translation.translated_text}"
      file.puts "Source Language: #{translation.source_lang}"
      file.puts "Target Language: #{translation.target_lang}"
      file.puts "Timestamp: #{timestamp}"
    end
  end
end
