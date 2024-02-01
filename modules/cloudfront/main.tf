# Get the certificate from AWS ACM
data "aws_acm_certificate" "issued" {
  domain   = var.certificate_domain_name
  statuses = ["ISSUED"]
}

#creating Cloudfront distribution :
resource "aws_cloudfront_distribution" "my_distribution" {
  enabled             = true
  aliases             =  [var.additional_domain_name]
  origin {
    domain_name = var.alb_domain_name
    origin_id   = var.alb_domain_name
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }
  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    target_origin_id       = var.alb_domain_name
    viewer_protocol_policy = "redirect-to-https"
    forwarded_values {
      headers      = []
      query_string = true
      cookies {
        forward = "all"
      }
    }
  }
  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["IN", "US", "CA"]
    }
  }
  tags = {
    Name = var.project_name
  }
  viewer_certificate {
    acm_certificate_arn      = "arn:aws:acm:us-east-1:843715177247:certificate/43d29c3e-b9a9-4c85-a955-0bd2894b0d6c"
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2018"
  }
}