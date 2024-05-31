require 'json'
require 'fileutils'  # This is necessary for creating directories

module Jekyll
  class GenerateJSON < Generator
    safe true
    priority :high

    def generate(site)
      # Load authors data from _data/authors.yml
      authors_data = site.data['authors']

      posts = site.posts.docs.map do |post|
        # Find the author's data from authors.yml
        author_data = authors_data[post.data['author']]

        # If author's data is found, use it; otherwise, set default values
        author_name = author_data ? author_data['name'] : 'Unknown Author'
        author_avatar = author_data ? author_data['avatar'] : '/default-avatar.jpg'

        # Calculate reading time
        reading_time = calculate_reading_time(post.content)

        {
          title: post.data['title'],
          url: post.url,
          date: post.date,
          content: post.content,
          author: {
            name: author_name,
            avatar: author_avatar
          },
          thumbnail: post.data['thumbnail'],
          summary: post.data['summary'],
          readingTime: reading_time
        }
      end

      # Ensure the _site directory exists
      dest_dir = site.dest
      FileUtils.mkdir_p(dest_dir) unless Dir.exist?(dest_dir)

      File.write(File.join(dest_dir, 'search.json'), JSON.pretty_generate(posts))
    end

    def calculate_reading_time(content)
      words_per_minute = 200 # Adjust as needed
      words = content.split.size
      minutes = (words / words_per_minute).ceil
      "#{minutes} min read"
    end
  end
end
