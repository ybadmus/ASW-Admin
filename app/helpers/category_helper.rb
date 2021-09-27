# frozen_string_literal: true

module CategoryHelper
  def descriptor(message)
    new = strip_html_tags message
    return new if new.length < 300

    "#{new.slice(0..300)}..."
  end

  private

  def strip_html_tags(s)
    s.to_s.split(/<.*?>/)
     .map(&:strip)
     .reject(&:empty?)
     .join(' ')
     .gsub(/\s,/, ',')
  end
end
