output "private_subnet_network_acl_id" {
  value       = aws_network_acl.private.*.id
  description = "The private subnet network ACL"
}
output "public_subnet_network_acl_id" {
  value       = aws_network_acl.public.*.id
  description = "The public subnet network ACL"
}

output "private_subnet_network_ids" {
  value       = aws_subnet.private.*.id
  description = "The private subnet network ACL"
}
output "public_subnet_network_ids" {
  value       = aws_subnet.public.*.id
  description = "The public subnet network ACL"
}



output "az_subnet_ids" {
  value       = zipmap(var.availability_zones, coalescelist(aws_subnet.private.*.id, aws_subnet.public.*.id))
  description = "Map of AZ names to subnet IDs"
}

output "az_route_table_ids" {
  value       = zipmap(var.availability_zones, coalescelist(aws_route_table.private.*.id, aws_route_table.public.*.id))
  description = " Map of AZ names to Route Table IDs"
}

output "az_ngw_ids" {
  value       = aws_nat_gateway.public.*.id
  description = "Map of AZ names to NAT Gateway IDs (only for public subnets)"
}
