class PatientController < ApplicationController

  before_filter :set_variables

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
    @patientID = params[:patientid]
    @patient = @patients[@patientID]
    @patientName = @patient[:firstName] + " " + @patient[:lastName]
    add_breadcrumb "Search", search_path
    add_breadcrumb "#{@patientName} Chart", chart_path(@patientID)
  end
  
  def editpatient
    @patientID = params[:patientid]
    @patient = @patients[@patientID]
    @patientName = @patient[:firstName] + " " + @patient[:lastName]
    add_breadcrumb "Search", search_path
    add_breadcrumb "#{@patientName} Chart", chart_path(@patientID)
    add_breadcrumb "Edit #{@patientName} Profile", editpatient_path(@patientID)
  end
  
  def vitalsOverview
    @patientID = params[:patientid]
    @patientName = @patients[@patientID][:firstName] + " " + @patients[@patientID][:lastName]
    add_breadcrumb "Search", search_path
    add_breadcrumb "#{@patientName} Chart", chart_path(@patientID)
    add_breadcrumb "#{@patientName} Vitals", vitalsOverview_path(@patientID)
  end
  
  def vital
    @patientID = params[:patientid]
    @patientName = @patients[@patientID][:firstName] + " " + @patients[@patientID][:lastName]
    @vitalID = params[:vitalid]
    @vitalName = @vitals[@vitalID]
    add_breadcrumb "Search", search_path
    add_breadcrumb "#{@patientName} Chart", chart_path(@patientID)
    add_breadcrumb "#{@patientName} Vitals", vitalsOverview_path(@patientID)
    add_breadcrumb @vitalName, vital_path(@patientID, @vitalID)
  end

  def tasks
    @patientID = params[:patientid]
    @patientName = @patients[@patientID][:firstName] + " " + @patients[@patientID][:lastName]
    @tasksCompleted = @patients[@patientID][:tasksCompleted]
    add_breadcrumb "Search", search_path
    add_breadcrumb "#{@patientName} Chart", chart_path(@patientID)
    add_breadcrumb "#{@patientName} Completed Tasks", tasks_path(@patientID)
  end
  
protected

  def set_variables
    @vitals = {
      "1" => "Body Temperature",
      "2" => "Heart Rate",
      "3" => "Respiratory Rate",
      "4" => "Blood Pressure"
    }
    @patients = {
      "1" => {
        firstName: "Patient",
        lastName: "1",
        gender: "Male",
        dob: "1/1/1980",
        height: "65",
        weight: "175",
        email: "abc@def.com",
        phoneNumber: "123-456-7890",
        address: "123 RIT Rd.",
        city: "Rochester",
        state: "NY",
        zip: "14623",
        medications: ["Med1", "Med2", "Med3"],
        symptoms: ["Headache", "Nausea", "Cough"],
        allergies: ["Pollen", "Cats"],
        tasksToComplete: ["Take blood pressure", "Take body temperature", "Give medication"],
        tasksCompleted: {
          "Give massage" => "10/10/2015 10:00am",
          "Take Heart Rate" => "10/10/2015 9:45am"
        }
      },
      "2" => {
        firstName: "Patient",
        lastName: "2",
        gender: "Male",
        dob: "1/1/1980",
        height: "65",
        weight: "175",
        email: "abc@def.com",
        phoneNumber: "123-456-7890",
        address: "123 RIT Rd.",
        city: "Rochester",
        state: "NY",
        zip: "14623",
        medications: ["Med1", "Med2", "Med3"],
        symptoms: ["Headache", "Nausea", "Cough"],
        allergies: ["Pollen", "Cats"],
        tasksToComplete: ["Take blood pressure", "Take body temperature", "Give medication"],
        tasksCompleted: {
          "Give massage" => "10/10/2015 10:00am",
          "Take Heart Rate" => "10/10/2015 9:45am"
        }
      },
      "3" => {
        firstName: "Patient",
        lastName: "3",
        gender: "Male",
        dob: "1/1/1980",
        height: "65",
        weight: "175",
        email: "abc@def.com",
        phoneNumber: "123-456-7890",
        address: "123 RIT Rd.",
        city: "Rochester",
        state: "NY",
        zip: "14623",
        medications: ["Med1", "Med2", "Med3"],
        symptoms: ["Headache", "Nausea", "Cough"],
        allergies: ["Pollen", "Cats"],
        tasksToComplete: ["Take blood pressure", "Take body temperature", "Give medication"],
        tasksCompleted: {
          "Give massage" => "10/10/2015 10:00am",
          "Take Heart Rate" => "10/10/2015 9:45am"
        }
      },
      "4" => {
        firstName: "Patient",
        lastName: "4",
        gender: "Male",
        dob: "1/1/1980",
        height: "65",
        weight: "175",
        email: "abc@def.com",
        phoneNumber: "123-456-7890",
        address: "123 RIT Rd.",
        city: "Rochester",
        state: "NY",
        zip: "14623",
        medications: ["Med1", "Med2", "Med3"],
        symptoms: ["Headache", "Nausea", "Cough"],
        allergies: ["Pollen", "Cats"],
        tasksToComplete: ["Take blood pressure", "Take body temperature", "Give medication"],
        tasksCompleted: {
          "Give massage" => "10/10/2015 10:00am",
          "Take Heart Rate" => "10/10/2015 9:45am"
        }
        },
      "5" => {
        firstName: "Patient",
        lastName: "5",
        gender: "Male",
        dob: "1/1/1980",
        height: "65",
        weight: "175",
        email: "abc@def.com",
        phoneNumber: "123-456-7890",
        address: "123 RIT Rd.",
        city: "Rochester",
        state: "NY",
        zip: "14623",
        medications: ["Med1", "Med2", "Med3"],
        symptoms: ["Headache", "Nausea", "Cough"],
        allergies: ["Pollen", "Cats"],
        tasksToComplete: ["Take blood pressure", "Take body temperature", "Give medication"],
        tasksCompleted: {
          "Give massage" => "10/10/2015 10:00am",
          "Take Heart Rate" => "10/10/2015 9:45am"
        }
      },
      "6" => {
        firstName: "Patient",
        lastName: "6",
        gender: "Male",
        dob: "1/1/1980",
        height: "65",
        weight: "175",
        email: "abc@def.com",
        phoneNumber: "123-456-7890",
        address: "123 RIT Rd.",
        city: "Rochester",
        state: "NY",
        zip: "14623",
        medications: ["Med1", "Med2", "Med3"],
        symptoms: ["Headache", "Nausea", "Cough"],
        allergies: ["Pollen", "Cats"],
        tasksToComplete: ["Take blood pressure", "Take body temperature", "Give medication"],
        tasksCompleted: {
          "Give massage" => "10/10/2015 10:00am",
          "Take Heart Rate" => "10/10/2015 9:45am"
        }
      }
    }
  end

end
