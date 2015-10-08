class PatientController < ApplicationController

  add_breadcrumb "home", :root_path

  def home
  end
  
  def new
    add_breadcrumb "new patient", new_path
  end
  
  def search
    add_breadcrumb "search", search_path
  end

  def record
    add_breadcrumb "search", search_path
    add_breadcrumb "patient 1", record_path
  end

  def tasks
    add_breadcrumb "search", search_path
    add_breadcrumb "patient 1", record_path
    add_breadcrumb "tasks", tasks_path
  end
end
