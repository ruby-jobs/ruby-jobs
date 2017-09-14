base_url = "http://#{request.host_with_port}"
  xml.instruct! :xml, :version=>'1.0'
  xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
    xml.url{
      xml.loc("http://rubyjobs.co")
      xml.changefreq("daily")
      xml.priority(1.0)
    }
  @jobs.each do |j|
    xml.url {
      xml.loc("http://rubyjobs.co/jobs/#{j.id}-#{j.title.parameterize}")
      xml.changefreq("weekly")
      xml.priority(0.3)
    }
  end
end
