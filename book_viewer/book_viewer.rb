require 'tilt/erubis'
require 'sinatra'
require 'sinatra/reloader'

before do
  # @contents = File.readlines('data/toc.txt')
  # @chapters = (1..12).map do |num|
  #   [num, File.read("data/chp#{num}.txt")]
  # end.to_h

  @contents = File.readlines('data/toc.txt')
  @chapters = @contents.map.with_index(1) do |name, num|
    { name: name, num: num, body: File.readlines("data/chp#{num}.txt", "\n\n") }
  end
end

helpers do
  def in_paragraphs(paragraphs)
    paragraphs.map.with_index(1) do |paragraph, idx|
      "<p id='p-#{idx}'>#{paragraph}</p>"
    end.join
  end

  def matching_chapters(query)
    return [] if query.to_s.strip.empty?

    matches = @chapters.select do |chapter|
      chapter[:body].join(' ') =~ /#{query}/i
    end

    matches.each do |match|
      match[:body].map!.with_index(1) do |paragraph, idx|
        [idx, highlight(paragraph, query)] if paragraph =~ /#{query}/i
      end.compact!
    end

    matches
  end

  def highlight(paragraph, query)
    paragraph.gsub(/(#{query})/i, '<strong>\1</strong>')
  end
end

not_found do
  redirect '/'
end

get '/' do
  @title = 'The Adventures of Sherlock Holmes'

  erb :home
end

get '/chapters/:number' do
  chapter = @chapters[params[:number].to_i - 1]
  @title = "Chapter #{chapter[:num]}: #{chapter[:name]}"
  @body = chapter[:body]

  erb :chapter
end

get '/search' do
  # query = params[:query]
  # unless query.to_s.strip.empty?
  #   matches = @chapters.select { |num, body| body =~ /#{query}/i }
  #   @matches = matching_nums.map { |num| [num, @contents[num - 1]] }
  # end

  @matches = matching_chapters(params[:query])

  erb :search
end
