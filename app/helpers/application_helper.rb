module ApplicationHelper
  def class_for(status:, disabled: false)
    if disabled
      :disabled
    elsif status == :complete
      'list-group-item-success'
    end
  end

  YOUTUBE = 'www.youtube.com'

  def embed_video(video_url)
    uri = URI.parse(video_url)
    src = case uri.host
    when YOUTUBE
      p = CGI.parse(uri.query)
      if v = p['v'].try(:first)
        render 'shared/embed/youtube', src: "//www.youtube.com/embed/#{v}"
      end
    end
  end
end
