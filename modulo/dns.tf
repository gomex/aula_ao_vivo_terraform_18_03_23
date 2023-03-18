data "aws_route53_zone" "selected" {
  name         = "${terraform.workspace}.internal.gomex.me."
  private_zone = false
}

resource "aws_route53_record" "record" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "${var.hostname}.${data.aws_route53_zone.selected.name}"
  type    = var.record_type
  ttl     = var.record_ttl
  records = [aws_instance.main.public_ip]
}