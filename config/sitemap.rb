require 'sitemap_generator'
require 'pry'
# local: rake sitemap:refresh:no_ping
# prod: rake sitemap:refresh

SitemapGenerator::Sitemap.default_host = "https://www.dainger.us/"
SitemapGenerator::Sitemap.verbose = true
SitemapGenerator::Sitemap.create_index = :auto
SitemapGenerator::Sitemap.public_path = 'public/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do

  add blog_posts_path, :changefreq => 'weekly', :priority => 0.9

  BlogPost.find_each do |post|
    add blog_post_path(post), :changefreq => 'weekly', :lastmod => post.created_at, :priority => 0.8
  end

  add 'assets/uploads/original/resume.pdf', :changefreq => 'monthly', :priority => 0.7
end
