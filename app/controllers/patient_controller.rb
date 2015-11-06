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
    @vitalName = @vitals[@vitalID][:name]
    @vitalRange = @vitals[@vitalID][:healthyRange]
    @inHealthyRange = Proc.new { |id, value|
      if id == '4' then
        sys = value[:systolic]
        dias = value[:diastolic]
        ((@vitalRange[:systolic][0]..@vitalRange[:systolic][1]).include?(sys)) or
          ((@vitalRange[:diastolic][0]..@vitalRange[:diastolic][1]).include?(dias))
      else
        value >= @vitalRange[0] and value <= @vitalRange[1]
      end
    }
    @units = @vitals[@vitalID][:units]
    @patientVital = @patients[@patientID][:vitals][@vitalID]
    @formattedData = @patientVital.map {|vital| {:date => vital[:time].iso8601, :value => vital[:value]}}.to_json

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

  def set_variables
    now = Time.new
    defaultMeasurements = {
      "1" => [],
      "2" => [],
      "3" => [],
      "4" => []
    }

    (0..12).each do |i|
      hourOffset = 12 - i

      defaultMeasurements["1"] << {
        :time => now - (hourOffset * 60 * 60),
        :value => 97.6 + rand(3)
      }
      defaultMeasurements["2"] << {
        :time => now - (hourOffset * 60 * 60),
        :value => 50 + rand(60)
      }
      defaultMeasurements["3"] << {
        :time => now - (hourOffset * 60 * 60),
        :value => 12 + rand(7)
      }
      defaultMeasurements["4"] << {
        :time => now - (hourOffset * 60 * 60),
        :value => {
          :systolic => 90 + rand(50),
          :diastolic => 60 + rand(30)
        }
      }
    end

    @vitals = {
      "1" => {
        :name => "Body Temperature",
        :units => "F",
        :healthyRange => [97.6, 99.6]
      },
      "2" => {
        :name => "Heart Rate",
        :units => "Beats/Min",
        :healthyRange => [60, 100]
      },
      "3" => {
        :name => "Respiratory Rate",
        :units => "Breaths/Min",
        :healthyRange => [12, 16]
      },
      "4" => {
        :name => "Blood Pressure",
        :units => "mm Hg",
        :healthyRange => {
          :systolic => [90, 120],
          :diastolic => [60, 80]
        }
      }
    }
    @patients = {
      "1" => {
        firstName: "John",
        lastName: "Cena",
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
        },
        vitals: defaultMeasurements
      },
      "2" => {
        firstName: "John",
        lastName: "Doe",
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
        },
        vitals: defaultMeasurements
      },
      "3" => {
        firstName: "Jane",
        lastName: "Doe",
        gender: "Female",
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
        },
        vitals: defaultMeasurements
      },
      "4" => {
        firstName: "Brian",
        lastName: "Cranston",
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
        },
        vitals: defaultMeasurements
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
        },
        vitals: defaultMeasurements
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
        },
        vitals: defaultMeasurements
      }
    }
  end

end
