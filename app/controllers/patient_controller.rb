class PatientController < ApplicationController

  add_breadcrumb "search", :root_path

  def search
  end

  def record
    add_breadcrumb "patient 1", record_path
  end

  def tasks
    add_breadcrumb "patient 1", record_path
    add_breadcrumb "tasks", tasks_path
  end
end
