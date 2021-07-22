# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create email: "ariel.santos@dcc.ufmg.br", name: "Admin", admin: true,
            password: ENV.fetch("LEITURA_DO_LUGAR_ADMIN_PASS", "praxis2021")

%w[Sobre Equipe].each do |content|
  Content.create title: content, slug: content.downcase, article: Article.new
end
