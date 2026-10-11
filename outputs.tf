output "federated_database_instances_id" {
  description = "Map of id values across all federated_database_instances, keyed the same as var.federated_database_instances except keys with no id are omitted"
  value       = { for k, v in mongodbatlas_federated_database_instance.federated_database_instances : k => v.id if v.id != null && length(v.id) > 0 }
}
output "federated_database_instances_cloud_provider_config" {
  description = "Map of cloud_provider_config values across all federated_database_instances, keyed the same as var.federated_database_instances except keys with no cloud_provider_config are omitted"
  value       = { for k, v in mongodbatlas_federated_database_instance.federated_database_instances : k => one(v.cloud_provider_config) if v.cloud_provider_config != null && length(v.cloud_provider_config) > 0 }
}
output "federated_database_instances_data_process_region" {
  description = "Map of data_process_region values across all federated_database_instances, keyed the same as var.federated_database_instances except keys with no data_process_region are omitted"
  value       = { for k, v in mongodbatlas_federated_database_instance.federated_database_instances : k => one(v.data_process_region) if v.data_process_region != null && length(v.data_process_region) > 0 }
}
output "federated_database_instances_hostnames" {
  description = "Map of hostnames values across all federated_database_instances, keyed the same as var.federated_database_instances except keys with no hostnames are omitted"
  value       = { for k, v in mongodbatlas_federated_database_instance.federated_database_instances : k => v.hostnames if v.hostnames != null && length(v.hostnames) > 0 }
}
output "federated_database_instances_name" {
  description = "Map of name values across all federated_database_instances, keyed the same as var.federated_database_instances except keys with no name are omitted"
  value       = { for k, v in mongodbatlas_federated_database_instance.federated_database_instances : k => v.name if v.name != null && length(v.name) > 0 }
}
output "federated_database_instances_private_endpoint_hostnames" {
  description = "Map of private_endpoint_hostnames values across all federated_database_instances, keyed the same as var.federated_database_instances except keys with no private_endpoint_hostnames are omitted"
  value       = { for k, v in mongodbatlas_federated_database_instance.federated_database_instances : k => v.private_endpoint_hostnames if v.private_endpoint_hostnames != null && length(v.private_endpoint_hostnames) > 0 }
}
output "federated_database_instances_project_id" {
  description = "Map of project_id values across all federated_database_instances, keyed the same as var.federated_database_instances except keys with no project_id are omitted"
  value       = { for k, v in mongodbatlas_federated_database_instance.federated_database_instances : k => v.project_id if v.project_id != null && length(v.project_id) > 0 }
}
output "federated_database_instances_state" {
  description = "Map of state values across all federated_database_instances, keyed the same as var.federated_database_instances except keys with no state are omitted"
  value       = { for k, v in mongodbatlas_federated_database_instance.federated_database_instances : k => v.state if v.state != null && length(v.state) > 0 }
}
output "federated_database_instances_storage_databases" {
  description = "Map of storage_databases values across all federated_database_instances, keyed the same as var.federated_database_instances except keys with no storage_databases are omitted"
  value       = { for k, v in mongodbatlas_federated_database_instance.federated_database_instances : k => v.storage_databases if v.storage_databases != null && length(v.storage_databases) > 0 }
}
output "federated_database_instances_storage_stores" {
  description = "Map of storage_stores values across all federated_database_instances, keyed the same as var.federated_database_instances except keys with no storage_stores are omitted"
  value       = { for k, v in mongodbatlas_federated_database_instance.federated_database_instances : k => v.storage_stores if v.storage_stores != null && length(v.storage_stores) > 0 }
}

