module HumanResources
  class SettingsController < ApplicationController
    layout "human_resources"
    def index
      @roles = Role.all
    end
  end
end
