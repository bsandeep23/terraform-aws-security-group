// Create security group

resource "aws_security_group" "this" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id
  tags        = merge(var.common_tags, map("Name", format("%s-%s-%s-%s-%s-sg", var.component, var.stack, var.stage, var.region, var.name)))
}

resource "aws_security_group_rule" "this" {
  count = length(var.sg_rules)

  security_group_id = aws_security_group.this.id
  description       = var.sg_rules[count.index].description
  from_port         = var.sg_rules[count.index].from_port
  to_port           = var.sg_rules[count.index].to_port
  protocol          = var.sg_rules[count.index].protocol
  cidr_blocks       = coalescelist(lookup(var.sg_rules[count.index], "ip_list", []), var.ip_list)
  type              = var.sg_rules[count.index].type
}
