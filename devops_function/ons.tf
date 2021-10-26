
#ONS - OCI Notification Service
#creates a topic and an email subscription


resource "oci_ons_notification_topic" "admin_notification_topic" {
  compartment_id = var.compartment_ocid
  name           = "admin topic"   #"${var.app_name}_${random_string.deploy_id.result}_topic"
  defined_tags   = { "${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }
}

#TODO: create multiple subscriptions based on list var
resource "oci_ons_subscription" "admin_subscription" {
    compartment_id = var.compartment_ocid
    endpoint = var.email_address
    protocol = "EMAIL"
    topic_id = oci_ons_notification_topic.admin_notification_topic.id

}