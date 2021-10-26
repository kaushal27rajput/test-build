Rackspace Stackdriver monitoring configuration
==============================================

Description
-----------

Contains deployment steps to create and remove notification channels and base-policy.

| Document | Location |
| RAX Base Policy | https://one.rackspace.com/display/MGCP/MGCP+Monitoring+Standards |

Deployments
-----------

`gcloud --project $projectpath deployment-manager deployments create rs-notification-channels --config notification-channels.yaml`

`gcloud --project $projectpath deployment-manager deployments create rs-sd-base-policy --config base-policy.yaml`

NAT GW Alert Policy instructions
--------------------------------

***NOTE*** You must run the following command:
`gcloud --project $projectpath beta logging metrics create nat_gw_dropped_conn --config-from-file=nat-gw-metric.yaml`

Failure to do so will result in the following error:

`The metric referenced by the provided filter is unknown. Check the metric name and labels.`