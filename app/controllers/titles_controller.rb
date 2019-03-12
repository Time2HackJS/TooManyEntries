class TitlesController < ApplicationController
  before_action :set_entry, only: :show

  def main
    @database = Entry.all
    @dbcount = 0
  end

  def create
    redirect_to root_path, flash: { alert: 'Sign in first!' } unless current_user&.admin
    if params[:entryname] and params[:genretype] and params[:entrydate] and params[:entrysynopsis] and params[:entrytags] and params[:entryposter]
      ename = params[:entryname].delete(',', '"', "'", ';')
      egenre = params[:genretype].delete(',', '"', "'", ';')
      edate = params[:entrydate].delete(',', '"', "'", ';')
      esyn = params[:entrysynopsis].delete(',', '"', "'", ';')
      etags = params[:entrytags].delete(',', '"', "'", ';')
      epos = params[:entryposter].delete(',', '"', "'", ';')
      Entry.create name: ename, genre: egenre, date: edate, synopsis: esyn, tags: etags, poster: epos
    end
  end

  def entryadd
    if Profile.find_by_username(current_user[:name]) == nil
      Profile.create username: current_user[:name], entries: ''
    end
    pentries = Profile.find_by_username(current_user[:name])
    curentries = pentries[:entries]. + ' ' + Lastentry.last[:entryid]
    pentries.update_attribute(:entries, curentries)
    Lastentry.destroy_all
    redirect_to root_path
  end

  def entrydelete
    pentries = Profile.find_by_username(current_user[:name])
    curentries = pentries[:entries]
    currs = curentries.gsub! Lastentry.last[:entryid], ' '
    pentries.update_attribute(:entries, currs)
    Lastentry.destroy_all
    redirect_to root_path
  end

  def set_entry
    @title = Entry.find(params[:id])
  end

  def show
    @title = Entry.find(params[:id])
  end

end
