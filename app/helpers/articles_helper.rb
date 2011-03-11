module ArticlesHelper
  
  def lite_textilized(text)
    RedCloth.new(text, [:lite_mode, :filter_html]).to_html
  end
end
