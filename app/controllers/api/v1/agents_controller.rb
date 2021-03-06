class Api::V1::AgentsController < ApplicationController
  def index
    @agents = Agent.all
    render 'index.json.jbuilder'
  end

  def show
    @agent = Agent.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    
    @agent = Agent.new(
      field_name: params[:field_name],
      base: params[:base],
      deployment_date: params[:deployment_date]
    )
    if @agent.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @agent.errors.full_messages }, status: 422
    end
  end

  def update
    @agent = Agent.find(params[:id])
    @agent.update(
      field_name: params[:field_name],
      base: params[:base],
      deployment_date: params[:deployment_date]
    )
    render 'show.json.jbuilder'
  end

  def destroy
    @agents = Agent.all
    @agent = Agent.find(params[:id])
    @agent.destroy
    render 'index.json.jbuilder'
  end
end
