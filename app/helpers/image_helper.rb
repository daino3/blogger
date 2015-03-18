module ImageHelper

  def image_link(url)
    stripped_url = url.gsub(/.*\/images\//, "")
    image_tag(stripped_url)
  end

  def resume_path()
    "/assets/#{Photo.find_by_title("resume").get_url(type: "original")}"
  end
end

