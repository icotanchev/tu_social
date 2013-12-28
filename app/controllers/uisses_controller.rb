# -*- coding: utf-8 -*-

require 'rake'
Rake::Task.clear # necessary to avoid tasks being loaded several times in dev mode
TuSocial::Application.load_tasks

class UissesController < ApplicationController

  before_action :set_uiss, only: [:show, :edit, :update, :destroy]
#  require 'pry'
  # GET /uisses
  # GET /uisses.json
  def index
    @egn = params[:egn]
    @fac_num = params[:fac_num]

    # puts @egn
    # test = '9102123046 121210169'
    # Rake::Task['marks'].invoke(test)
 #   %x["rake marks 9102123046 121210169"]
#    puts Rake::Task['marks 9102123046 121210169']
    # @uisses = Uiss.all
  end

  def testov(first, last)
    a = Mechanize.new
    a.get('http://student.tu-sofia.bg/') do |login_page|
      
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
    
    #marks_array = []
    puts egn
    puts fac_num
 #   test = "#{egn} #{fac_num}"
#    Rake::Task['marks'].invoke(egn)
    testov(egn, fac_num)

    puts '=====FROM====='

    puts $marks_array.last
#    puts $marks_array
    puts '=====TO====='

    respond_to do |format|
      format.html { render action: 'index' }
      format.json { $marks_array }
      format.js { render json: $marks_array.to_json }
      # if @uiss.save
      #   format.html { redirect_to @uiss, notice: 'Uiss was successfully created.' }
      #   format.json { render action: 'show', status: :created, location: @uiss }
      # else
      #   format.html { render action: 'new' }
      #   format.json { render json: @uiss.errors, status: :unprocessable_entity }
      # end
    end
  end

  # # PATCH/PUT /uisses/1
  # # PATCH/PUT /uisses/1.json
  # def update
  #   respond_to do |format|
  #     if @uiss.update(uiss_params)
  #       format.html { redirect_to @uiss, notice: 'Uiss was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @uiss.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /uisses/1
  # # DELETE /uisses/1.json
  # def destroy
  #   @uiss.destroy
  #   respond_to do |format|
  #     format.html { redirect_to uisses_url }
  #     format.json { head :no_content }
  #   end
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_uiss
  #     @uiss = Uiss.find(params[:id])
  #   end

  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def uiss_params
  #     params[:uiss]
  #   end
end
