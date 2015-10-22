class PatientController < ApplicationController

  add_breadcrumb "Home", :root_path

  def home
  end
  
  def registerpatient
    add_breadcrumb "Register Patient", registerpatient_path
  end
  
  def search
    add_breadcrumb "Search", search_path
  end

  def chart
    add_breadcrumb "Search", search_path
    add_breadcrumb "Patient 1 Chart", chart_path
  end
  
  def editpatient
    add_breadcrumb "Search", search_path
    add_breadcrumb "Patient 1 Chart", chart_path
    add_breadcrumb "Edit Patient 1 Profile", editpatient_path
  end
  
  def vitalsOverview
    add_breadcrumb "Search", search_path
    add_breadcrumb "Patient 1 Chart", chart_path
    add_breadcrumb "Patient 1 Vitals", vitalsOverview_path
    @vitals = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
  
  def vital
    @vitalID = params[:id]
    add_breadcrumb "Search", search_path
    add_breadcrumb "Patient 1 Chart", chart_path
    add_breadcrumb "Patient 1 Vitals", vitalsOverview_path
    add_breadcrumb "Vital #{@vitalID}", vital_path(@vitalID)
  end

  def tasks
    add_breadcrumb "Search", search_path
    add_breadcrumb "Patient 1 Chart", chart_path
    add_breadcrumb "Completed Tasks", tasks_path
  end
end
