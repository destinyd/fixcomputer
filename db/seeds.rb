# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html

puts 'pricing'
Price.create name: "市内上门费",price: 20
Price.create name: "重装系统",price: 10
Price.create name: "简单硬件调试",price: 10
Price.create name: "病毒查杀",price: 0, plus: "10~20，视病毒类型而定"
Price.create name: "常用软件安装",price: 10
Price.create name: "硬件维修",price: 0,plus: "因有较大差异，价格面议"
Price.create name: "局域网搭建、调试",price: 0,plus: "视台数、具体环境定"
