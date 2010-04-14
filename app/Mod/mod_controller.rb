require 'rho/rhocontroller'
require 'helpers/browser_helper'

class ModController < Rho::RhoController
  include BrowserHelper

  #GET /Mod
  def index
    @mods = Mod.find(:all)
    render
  end

  # GET /Mod/{1}
  def show
    @mod = Mod.find(@params['id'])
    if @mod
      render :action => :show
    else
      redirect :action => :index
    end
  end

  # GET /Mod/new
  def new
    @mod = Mod.new
    render :action => :new
  end

  # GET /Mod/{1}/edit
  def edit
    @mod = Mod.find(@params['id'])
    if @mod
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /Mod/create
  def create
    @mod = Mod.new(@params['mod'])
    @mod.save
    redirect :action => :index
  end

  # POST /Mod/{1}/update
  def update
    @mod = Mod.find(@params['id'])
    @mod.update_attributes(@params['mod']) if @mod
    redirect :action => :index
  end

  # POST /Mod/{1}/delete
  def delete
    @mod = Mod.find(@params['id'])
    @mod.destroy if @mod
    redirect :action => :index
  end
end
