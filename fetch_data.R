library(httr)
library(jsonlite)

# Function to fetch and parse data from the API
fetch_pollution_data <- function() {
  url <- "https://api.open-meteo.com/v1/air-quality"
  params <- list(
    latitude = 52.52,  # Example: Berlin latitude
    longitude = 13.405,  # Example: Berlin longitude
    hourly = "pm10,pm2_5,no2,so2,o3,co"  # List of pollutants
  )
  
  # Fetch data from the API
  response <- GET(url, query = params)
  
  # Check if the request was successful
  if (status_code(response) == 200) {
    data <- fromJSON(content(response, "text"))
    pollutants <- data$hourly
    
    return(pollutants)
  } else {
    stop("Failed to fetch data")
  }
}

# Example function call
pollution_data <- fetch_pollution_data()
print(pollution_data)  # For debugging, prints the pollution data
