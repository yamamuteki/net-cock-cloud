# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Article.delete_all

File.open("db/POPO_03.nck", mode = "rt:sjis:utf-8") do |f|
    input = f.read
    articles_text = input.split("[32m-	-	-	-	-	-	-	-	-[m\n")
    puts board_title = articles_text.shift
    articles_text.each do |article_text|
        article_texts = article_text.split("\n") 
        puts article_header = article_texts[0]
        puts article_desc1 = article_texts[1]
        puts article_desc2 = article_texts[2]
        puts board_name = article_header.split[0].split('(')[0]
        puts id = article_header.split[0].match(/\d+/)[0]
        puts title = article_header.split(" ", 4)[3]
        puts posted_at = DateTime.parse(article_header.split[1] + " " + article_header.split[2] + "+09:00")
        Article.create(id: id, title: title, body: article_text, posted_at: posted_at) 
    end
end