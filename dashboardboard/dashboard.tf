data "external" "example" {
   program = ["python", "${path.module}/dashboardData.py", "${var.fileName}"]
} 


data "local_file" "dashboard" {
	filename = "${path.root}/${data.external.example.result.filename}"
}

# OutPut of the result
#output "manzoor" {
#	value = "${data.external.example.result.widgets}"
# 	value = "${split("%%",data.external.example.result.widgets)}"
#	value = "${jsonencode(local.dashboard_json)}"
#	value = "${file("/Users/ahamedm/onecms-demo/dashboardData.json")}"
#}

#locals {
#	type = "list"
#	dashboard_json = "${split("%%",data.external.example.result.widgets)}"
#}



resource "aws_cloudwatch_dashboard" "main" {
   dashboard_name = "${var.dashboardName}"
   dashboard_body = "${data.local_file.dashboard.content}"
}
