# frozen_string_literal: true

require 'shellwords'

module Ffprober
  module Ffmpeg
    class Exec
      CHAPTER_SUPPORT = Gem::Version.new('2.0.0')

      def initialize(finder = Ffprober::Ffmpeg::Finder)
        @finder = finder
      end

      def json_output(filename)
        `#{@finder.path} #{probe_options(@finder)} #{Shellwords.escape(filename)}`
      end

      def ffprobe_version_output
        @ffprobe_version_output ||= begin
          if @finder.path.nil?
            ''
          else
            `#{@finder.path} -version`
          end
        end
      end

      def probe_options(finder)
        return ffprobe_options if finder.ffprobe?
        avprobe_options
      end

      def ffprobe_options
        base_options = '-v quiet -print_format json -show_format'\
                       ' -show_streams -show_error'

        if ffprobe_version.version >= CHAPTER_SUPPORT
          options = base_options + ' -show_chapters'
        end

        options
      end

      def avprobe_options
        '-v quiet -of json -show_format -show_streams'
      end

      def ffprobe_version
        Ffprober::Ffmpeg::Version.new(self)
      end
    end
  end
end
