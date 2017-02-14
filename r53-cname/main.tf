variable "region" { default = "" }
variable "profile" { default = "" }
variable "ttl" { default = 86400 }

variable "domain" {}
variable "zone_id" {}
variable "records" { type = "list" }

provider "aws" {
  alias = "${var.region}"
  region = "${var.region}"
}

resource "aws_route53_record" "cname" {
  zone_id = "${var.zone_id}"
  name = "${var.domain}"
  type = "CNAME"
  ttl = "${var.ttl}"
  records = [ "${var.records}" ]
}
