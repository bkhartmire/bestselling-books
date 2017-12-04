require 'pry'

class BestsellingBooksByGenre::Nonfiction
  attr_accessor :title, :author, :summary, :link_to_buy

  def initialize
  end

  def self.scraper
    BestsellingBooksByGenre::Scraper.new
  end

  def self.nonfiction_bestsellers
    @nonfiction_books = []
    scraper.scrape_nonfiction.each do |book|
      @nonfiction_books << book
    end
    @nonfiction_books
  end

  def self.scrape_nonfiction
    doc = scraper.scrape_nonfiction
    book = self.new
    book.title = doc.search(".book-body h3.title").text.strip
    book.author = doc.search(".book-body p.author").text.gsub("by ", "").strip
    book.summary = doc.search(".book-body p.description").text.strip
      #Fix this code later:
      #book.link_to_buy = doc.css("section.subcategory footer.book-footer a").first.attr("href").value
    book
  end
end
