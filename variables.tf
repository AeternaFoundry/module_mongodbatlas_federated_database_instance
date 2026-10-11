variable "federated_database_instances" {
  description = <<EOT
Map of federated_database_instances, attributes below
Required:
    - name
    - project_id
Optional:
    - cloud_provider_config (block):
        - aws (optional, block):
            - role_id (required)
            - test_s3_bucket (required)
        - azure (optional, block):
            - role_id (required)
    - data_process_region (block):
        - cloud_provider (required)
        - region (required)
    - storage_databases (block):
        - collections (optional, block):
            - data_sources (optional, block):
                - allow_insecure (optional)
                - collection (optional)
                - collection_regex (optional)
                - database (optional)
                - database_regex (optional)
                - dataset_name (optional)
                - default_format (optional)
                - path (optional)
                - provenance_field_name (optional)
                - store_name (optional)
                - urls (optional)
            - name (optional)
        - name (optional)
        - views (optional, block):
    - storage_stores (block):
        - additional_storage_classes (optional)
        - allow_insecure (optional)
        - bucket (optional)
        - cluster_name (optional)
        - default_format (optional)
        - delimiter (optional)
        - include_tags (optional)
        - name (optional)
        - prefix (optional)
        - project_id (optional)
        - provider (optional)
        - public (optional)
        - read_preference (optional, block):
            - max_staleness_seconds (optional)
            - mode (optional)
            - tag_sets (optional, block):
                - tags (required, block):
                    - name (optional)
                    - value (optional)
        - region (optional)
        - urls (optional)
EOT

  type = map(object({
    name       = string
    project_id = string
    cloud_provider_config = optional(object({
      aws = optional(object({
        role_id        = string
        test_s3_bucket = string
      }))
      azure = optional(object({
        role_id = string
      }))
    }))
    data_process_region = optional(object({
      cloud_provider = string
      region         = string
    }))
    storage_databases = optional(list(object({
      collections = optional(list(object({
        data_sources = optional(list(object({
          allow_insecure        = optional(bool)
          collection            = optional(string)
          collection_regex      = optional(string)
          database              = optional(string)
          database_regex        = optional(string)
          dataset_name          = optional(string)
          default_format        = optional(string)
          path                  = optional(string)
          provenance_field_name = optional(string)
          store_name            = optional(string)
          urls                  = optional(list(string))
        })))
        name = optional(string)
      })))
      name = optional(string)
      views = optional(list(object({
      })))
    })))
    storage_stores = optional(list(object({
      additional_storage_classes = optional(list(string))
      allow_insecure             = optional(bool)
      bucket                     = optional(string)
      cluster_name               = optional(string)
      default_format             = optional(string)
      delimiter                  = optional(string)
      include_tags               = optional(bool)
      name                       = optional(string)
      prefix                     = optional(string)
      project_id                 = optional(string)
      provider                   = optional(string)
      public                     = optional(string)
      read_preference = optional(object({
        max_staleness_seconds = optional(number)
        mode                  = optional(string)
        tag_sets = optional(list(object({
          tags = list(object({
            name  = optional(string)
            value = optional(string)
          }))
        })))
      }))
      region = optional(string)
      urls   = optional(list(string))
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.federated_database_instances : (
        v.storage_stores == null || alltrue([for item in v.storage_stores : (item.read_preference == null || (item.read_preference.tag_sets == null || alltrue([for item in item.read_preference.tag_sets : (length(item.tags) >= 1)])))])
      )
    ])
    error_message = "Each tags list must contain at least 1 items"
  }
}

