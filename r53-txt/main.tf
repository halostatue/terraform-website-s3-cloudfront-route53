variable "region" { default = "" }
variable "profile" { default = "" }
variable "ttl" { default = 86400 }

variable "zone_id" {}
variable "domain" {}
variable "records" { type = "list" }

provider "aws" {
  region = "${var.region}"
  profile = "${var.profile}"
}

resource "aws_route53_record" "txt" {
  zone_id = "${var.zone_id}"
  name = "${var.domain}"
  type = "TXT"
  ttl = "${var.ttl}"

  records = [ "${var.records}" ]
}
