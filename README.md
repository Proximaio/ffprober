# Ffprober

a Ruby wrapper for ffprobe (part of ffmpeg)


## Installation

Add this line to your application's Gemfile:

    gem 'ffprober'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ffprober

## Usage

    require 'ffprober'
    ffprobe = Ffprober::Parser.from_file("my_awesome_video.mp4")
    ffprobe.size #=> 44772490

## TODOS
a smarter way to determine the version of ffprobe

## FFMPEG version
tested with ffprobe version 0.10.2

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
