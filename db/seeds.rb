# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Board.delete_all
Author.delete_all
Article.delete_all

files = ['db/POPO_03.nck', 'db/POPO_03.LOG', 'db/POPO_05.nck', 'db/POPO_05.LOG']

files.each do |file|
    File.open(file, mode = "rt:cp932:utf-8", invalid: :replace, undef: :replace) do |f|
        input = f.read
        articles_text = input.split("[32m-	-	-	-	-	-	-	-	-[m\n")
        puts board_title = articles_text.shift.strip
        board = Board.find_or_create_by(title: board_title)
        articles_text.each do |article_text|
            article_texts = article_text.split("\n")
            puts article_header = article_texts[0]
            puts article_desc1 = article_texts[1].rstrip
            puts article_desc2 = article_texts[2].rstrip
            puts board_name = article_header.split[0].split('(')[0]
            puts title = article_header.split(" ", 4)[3]
            puts posted_at = DateTime.parse(article_header.split[1] + " " + article_header.split[2] + "+09:00")
            puts author_name = if article_desc1.start_with?("  ")
                article_desc1.match(/:(.*)/)[1]
            else
                article_desc2.match(/:(.*)/)[1]
            end
            author = Author.find_or_create_by(name: author_name)
            Article.create(title: title, body: article_text, posted_at: posted_at, author: author, board: board)
        end
    end
end