# -*- coding: utf-8 -*-
class UissesController < ApplicationController
  before_action :set_uiss, only: [:show, :edit, :update, :destroy]
  def index
    # @egn = params[:egn]
    # @fac_num = params[:fac_num]
  end

  def testov(first, last)
    puts first
    puts last

    $marks_array = []
    a = Mechanize.new

    a.get('http://student.tu-sofia.bg/') do |login_page|
      puts "IN"
      login_page.form_with(name: 'studlogin') do |form|
        form.field_with(id: 'egn').value = first
        form.field_with(id: 'fn').value = last

        login_page = a.submit(form, form.button_with(id: 'login'))
        
        marks = a.click(login_page.link_with(:text => /Оценки/))

        content =  Nokogiri::HTML(marks.body)
        
        content.css('.list_table').each do |f|
          $marks_array << f.content
          puts f.content
        end
      end
    end
  end

  def create
    egn = params[:uiss][:egn]
    fac_num = params[:uiss][:fac_num]
    
    testov(egn, fac_num)

    respond_to do |format|
      format.html { render action: 'index' }
      format.json { $marks_array }
      format.js { render json: $marks_array.to_json }
    end
  end
end
