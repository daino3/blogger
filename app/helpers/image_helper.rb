module ImageHelper

  def image_link(url)
    stripped_url = url.gsub(/.*\/images\//, "")
    image_tag(stripped_url)
  end
end

