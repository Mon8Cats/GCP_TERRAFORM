locals {
    owners = var.business_division
    environment = var.environment
    name = "${var.business_division}-${var.environment}"
    common_tags = {
        owners = locals.owners
        environment = local.environment
    }
}
