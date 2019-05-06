# API Gateway

variable "api_gateway_name" {
  default 	= "url-shortener-api-gateway"
  description 	= "The name you would like to assign to your API gateway"
  type 		= "string" 
}

variable "api_gateway_description" {
  default 	= "API Gateway for the URL shortener project"
  description 	= "The description of your API gateway"
  type 		= "string" 
}

variable "api_gateway_deployment_stage_name" {
  default 	= "prod"
  type          = "string"
  description   = "The name of the stage to create"
}

variable "create_short_url_lambda_end_point_api_key_required" {
  default 	= "true"
  type          = "string"
  description   = "Whether or not we want to secure the end point of the Create Short URL endpoint with an API key"
}

variable "redirect_short_url_lambda_end_point_api_key_required" {
  default 	= "true"
  type          = "string"
  description   = "Whether or not we want to secure the end point of the redirect Short URL endpoint with an API key"
}

# Lambdas

variable "create_short_url_lambda_function_name" {
  default 	= "url-shortener-create-short-url-lambda"
  description 	= "Name we would like to assign to the shorten lambda function"
  type 		= "string"
}

variable "create_short_url_lambda_s3_key" {
  default       = "createshorturl-0.0.1-SNAPSHOT.jar"
  description   = "Object key of the S3 bucket where we want to store our code"
  type          = "string"
}

variable "redirect_short_url_lambda_function_name" {
  default 	= "url-shortener-redirect-short-url-lambda"
  description 	= "Name we would like to assign to the redirect lambda function"
  type 		= "string"
}

variable "redirect_short_url_lambda_s3_key" {
  default       = "redirectshorturl-0.0.1-SNAPSHOT.jar"
  description   = "Object key of the S3 bucket where we want to store our code"
  type          = "string"
}

# Lambda S3 Buckets

variable "create_short_url_lambda_code_s3_bucket_name" {
  default 	= "create-short-url-lambda-code-bucket"
  description 	= "The name of the S3 bucket where we would like to store our code for the create short url service."
  type 		= "string"
}

variable "redirect_short_url_lambda_code_s3_bucket_name" {
  default 	= "redirect-short-url-lambda-code-bucket"
  description 	= "The name of the S3 bucket where we would like to store our code for the redirect short url service"
  type 		= "string"
}

# Lambda Integration with API Gateway

variable "create_short_url_lambda_api_gateway_path_part" {
  default 	= "shortened-url-information"
  description 	= "The path we want to make the request to"
  type 		= "string"
}

variable "create_short_url_lambda_api_gateway_http_method" {
  default 	= "POST"
  description 	= "The HTTP method we would like to trigger the request"
  type 		= "string"
}

variable "redirect_short_url_lambda_api_gateway_path_part_root" {
  default 	= "shortened-url-information"
  description 	= "The root of the redirect request"
  type 		= "string"
}

variable "redirect_short_url_lambda_api_gateway_path_part_short_url_id" {
  default 	= "{short-url}"
  description 	= "The part of the redirect request identifying the short URL."
  type 		= "string"
}

variable "redirect_short_url_lambda_api_gateway_path_part_redirect" {
  default 	= "redirect"
  description 	= "The part of the redirect request informing us to redirect"
  type 		= "string"
}

variable "redirect_short_url_lambda_api_gateway_http_method" {
  default 	= "GET"
  description 	= "The HTTP method we would like to trigger the request"
  type 		= "string"
}

variable "api_gateway_timeout_milliseconds" {
  default 	= "20000"
  description   = "Time in milliseconds before the API integration times out"
  type          = "string"
}

# Dynamo DB

variable "dynamo_db_table_name" {
  default 	= "url-shortener-short-urls"
  type 		= "string"
  description 	= "The name of the DynamoDb table we would like to create"
}

variable "dynamo_db_read_capacity" {
  default 	= "2"
  type 		= "string"
  description   = "The number of provisioned read capacity we would like"
}

variable "dynamo_db_write_capacity" {
  default 	= "2"
  type 		= "string"
  description   = "The number of provisioned write capacity we would like"
}

variable "dynamo_db_hash_key" {
  default 	= "shortUrl"
  type 		= "string"
  description   = "The hash, partition or primary key"
}

variable "dynamo_db_range_key" {
  default 	= "longUrl"
  type 		= "string"
  description   = "The range, sort or composite key"
}

variable "dynamo_db_list_of_attributes" {
  default 	= [	{
    				name = "shortUrl"
    				type = "S"
  			},
			{
				name = "longUrl"
				type = "S"
			}
		]
  type 		= "list"
  description   = "A list of objects representing the attributes we would like in our table"
}

# AWS Settings

variable "aws_profile" {
  default 	= "urlshorteneradministrator"
  description 	= "Profile to be used"
  type        	= "string"
}

variable "aws_region" {
  default 	= "eu-west-1"
  description 	= "Region to be used"
  type        	= "string"
}

