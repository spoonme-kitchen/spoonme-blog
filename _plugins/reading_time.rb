module Jekyll
    module ReadingTimeFilter
      def reading_time(input)
        words_per_minute = 180 # Adjust as needed
        words = input.split.size
        minutes = (words / words_per_minute).ceil
        "#{minutes} min read"
      end
    end
  end
  
  Liquid::Template.register_filter(Jekyll::ReadingTimeFilter)