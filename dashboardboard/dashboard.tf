data "external" "example" {
   program = ["python", "${path.module}/dashboardData.py", "${var.fileName}"]
} 


data "local_file" "dashboard" {
	filename = "${path.root}/${data.external.example.result.filename}"
}

resource "aws_cloudwatch_dashboard" "main" {
   dashboard_name = "${var.dashboardName}"
   dashboard_body = "${data.local_file.dashboard.content}"
}
