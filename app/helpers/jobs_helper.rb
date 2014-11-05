module JobsHelper

  def link_to_twitter(title)
    tag_a = []
    url = CGI.escape(request.url)
    tag_a << %(<a href="https://twitter.com/intent/tweet?)
    tag_a << %(hashtags=RubyJobs&amp;)
    tag_a << %(original_referer=#{url}&amp;)
    tag_a << %(text=Vaga%20para%20#{CGI.escape(title)}&amp;)
    tag_a << %(tw_p=tweetbutton&amp;url=#{url}")
    tag_a << %(class="btn btn-info" target="_blank" >)
    tag_a << %(<i class="fa fa-twitter fa-lg"> </i>  Tweet</a>)
    tag_a.join.html_safe
  end

  def modality(job)
    job.remote ? "Remoto": "Presencial"
  end

  def badger(job)
    'badger-right' if job.remote
  end

  def modality_badger(job)
    modality(job) if job.remote?
  end

end
