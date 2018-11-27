module ApplicationHelper

  def br(str)
    if str.nil?
      return str
    end
    h(str).gsub(/(\r\n?)|(\n)/, '<br />').html_safe
  end

  def rbr(str)
    if str.nil?
      return str
    end
    str.gsub(/(\r\n?)|(\n)/, '<br />').html_safe
  end

  def html(str)
    if str.nil?
      return ''
    end
    str.html_safe
  end
end
