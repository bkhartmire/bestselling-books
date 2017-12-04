class BestsellingBooksByGenre::Scraper
  def self.scrape_fiction
    doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
    book = self.new
    book.title = doc.search("section.subcategory .book-body h3.title")[0].text.strip
    book.author = doc.search("section.subcategory .book-body p.author")[0].text.gsub("by ", "").strip
    book.summary = doc.search("section.subcategory .book-body p.description")[0].text.strip
    #Fix this code later:
    #book.link_to_buy = doc.css("section.subcategory footer.book-footer a").first.attr("href")[0].value
    book
  end

  def self.scrape_nonfiction
    doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
    book = self.new
    book.title = doc.search("section.subcategory .book-body h3.title")[2].text.strip
    book.author = doc.search("section.subcategory .book-body p.author")[2].text.gsub("by ", "").strip
    book.summary = doc.search("section.subcategory .book-body p.description")[2].text.strip
    #Fix this code later:
    #book.link_to_buy = doc.css("section.subcategory footer.book-footer a").first.attr("href").value
    book
  end
end