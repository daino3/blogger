require 'sitemap_generator'
require 'pry'
# local: rake sitemap:refresh:no_ping
# prod: rake sitemap:refresh

SitemapGenerator::Sitemap.default_host = "http://www.dainger.us/"
SitemapGenerator::Sitemap.verbose = true
SitemapGenerator::Sitemap.create_index = :auto
SitemapGenerator::Sitemap.public_path = 'public/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do

  add blog_posts_path, changefreq: 'weekly', priority: 0.9

  BlogPost.includes(:tags).published.all do |post|
    add blog_post_path(post), changefreq: 'weekly', lastmod: post.created_at, priority: 0.8

    post.tags.each do |tag|
      add tag_path(tag), changefreq: 'weekly', lastmod: tag.created_at, priority: 0.8
    end
  end

  add 'assets/uploads/original/resume.pdf', changefreq: 'monthly', priority: 0.7
end
