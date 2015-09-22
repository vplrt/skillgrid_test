module ApplicationHelper
  def base_title
    "SkillgridTest"
  end

  def full_title(base_title, page_title)
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def bootstrap_class_for flash_type
    case flash_type
      when "success"
        "alert-success"
      when "error"
        "alert-danger"
      when "alert"
        "alert-danger"
      when "notice"
        "alert-info"
      else
        flash_type.to_s
    end
  end
end
