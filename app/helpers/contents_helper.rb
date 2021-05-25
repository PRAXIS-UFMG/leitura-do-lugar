module ContentsHelper
  def human_name
    I18n.t "activerecord.attributes.content.name.#{@content.name}"
  end

  def available_names
    if @content.new_record?
      taken = Content.all_taken_names
      Content::NAMES.except(*taken.map(&:to_sym)).transform_keys { |k| t("activerecord.attributes.content.name.#{k}") }
    else
      { t("activerecord.attributes.content.name.#{@content.name}") => @content.name }
    end
  end
end
