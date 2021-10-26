
#sets up several event rules to monitor users and


resource "oci_events_rule" "identity_rule" {
    actions {
        actions {
            action_type = "ONS"
            is_enabled = "true"

            description = "This monitors most identity events."
            #function_id = oci_functions_function.test_function.id
            #stream_id = oci_streaming_stream.test_stream.id
            topic_id = oci_ons_notification_topic.admin_notification_topic.id
        }
    }
    compartment_id = var.compartment_ocid
    condition = local.identity_condition
    display_name = "Identity_monitoring"
    is_enabled = "true"

}


#rules logic - condition
#use console to generate rule logic
locals {
  identity_condition = <<EOT
{"eventType":
[com.oraclecloud.identitycontrolplane.updateauthenticationpolicy,
com.oraclecloud.identitycontrolplane.createdynamicgroup,
com.oraclecloud.identitycontrolplane.deletedynamicgroup,
com.oraclecloud.identitycontrolplane.updatedynamicgroup,
com.oraclecloud.identitycontrolplane.addusertogroup,
com.oraclecloud.identitycontrolplane.creategroup,
com.oraclecloud.identitycontrolplane.deletegroup,
com.oraclecloud.identitycontrolplane.removeuserfromgroup,
com.oraclecloud.identitycontrolplane.updategroup,
com.oraclecloud.identitycontrolplane.createidentityprovider,
com.oraclecloud.identitycontrolplane.deleteidentityprovider,
com.oraclecloud.identitycontrolplane.updateidentityprovider,
com.oraclecloud.identitycontrolplane.createidentityprovidergroup,
com.oraclecloud.identitycontrolplane.deleteidentityprovidergroup,
com.oraclecloud.identitycontrolplane.addusertoidpgroup,
com.oraclecloud.identitycontrolplane.removeuserfromidpgroup,
com.oraclecloud.identitycontrolplane.createidpgroupmapping,
com.oraclecloud.identitycontrolplane.deleteidpgroupmapping,
com.oraclecloud.identitycontrolplane.updateidpgroupmapping,
com.oraclecloud.identitycontrolplane.createidpuser,
com.oraclecloud.identitycontrolplane.deleteidpuser,
com.oraclecloud.identitycontrolplane.updatemyrecoveryemail,
com.oraclecloud.identitycontrolplane.createpolicy,
com.oraclecloud.identitycontrolplane.deletepolicy,
com.oraclecloud.identitycontrolplane.updatepolicy,
com.oraclecloud.identitycontrolplane.activateuser,
com.oraclecloud.identitycontrolplane.createuser,
com.oraclecloud.identitycontrolplane.deactivateuser,
com.oraclecloud.identitycontrolplane.deleteuser,
com.oraclecloud.identitycontrolplane.updateuser,
com.oraclecloud.identitycontrolplane.updateusercapabilities,
com.oraclecloud.identitycontrolplane.createfederateduser
]
}
EOT


}