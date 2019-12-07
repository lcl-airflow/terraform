// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("CREDENTIALS_FILE.json")}"
 project     = "playground-s-11-7c616e"
 region      = "us-east2"
}


resource "google_composer_environment" "test" {
  name   = "lcl-data-management"
  region = "us-central1"

	config {
    software_config {
      airflow_config_overrides = {
        core-load_example = "True"
      }

      pypi_packages = {
        numpy = ""
        scipy = "==1.1.0"
        fastavro = ""
        avro = ""
      }
    }
  }
}


